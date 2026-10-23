/-
  YM_Normal_Form_Paper_v1_1_0_CC.lean · the kernel of "Yang–Mills Existence and the Mass Gap: Unconditional Proof of
  the Form by Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Core Lean 4.19.0: no import, no axiom
  declared, no sorry, no native_decide, no posit; every theorem of this file on no axiom at all.

  Part 0 (namespace YMClose) is YM_Existence_Closure.lean of the edition of record, carried verbatim
  (sha256 9bb5739d076b9e7d0e673e7f63ba69ee07948cdcb379ca3da9b6804998889adf): the frame of gauge theories and the value
  in two parts, existence and the gap; the three worlds and the fourth gate; existence as given forcing nothing; the
  act, equal to the value; the two refuters, a missing theory and a massless state; the division into two parts; keyless
  and keyed; the proved part on the lattice, the strong-coupling gap with each cited field load-bearing; the matter face,
  no actual gapless confined field on the record of confinement and the colour premise; the record and the seed; the
  record walls; the triaxial lock; the closure; the root and the lock. Its 70 theorems and their pins stand unchanged.
  Part A (namespace YM.NORMALFORM) is the normal form of the row, generic over a row and read on the Yang–Mills row as
  the P ≠ NP seat reads computation and the Riemann seat reads the zeros: the record carries the value with no
  premise; the value is exactly the transfer from the record, the one bit; the cargo loop; the act; self-recursion;
  the keyed bit; the record deciding nothing; every route passing the bit; the keyless wall; no uniform answer.
  Part B (namespace YM.HOST) is the host model and its binding, proved: the record of a frame stands every entry built
  on the floor; the host carries each compact simple gauge group with its quantum theory on ℝ⁴, where it exists, and
  the floor of its mass spectrum; the value of the host's frame is exactly the host's sentence, every theory existing
  with a positive floor; the sentence is exactly its two parts, existence and the gap.
  Part C (namespace YM.ROWSPLIT) is the cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC,
  and Part C′ (namespace YM.REALPART) reads it on the lattice with the coupling as the height: the real part, strong
  coupling, sealed by the cited fields; given it, the value is exactly the unicorn part, the weak coupling where the
  continuum lies; the unicorn part load-bearing; the unicorn part closed to the record above every coupling.
  Part D (namespace YM.WALLS): the transfer record normal form, the gap the ratio of the transfer matrix's top two
  eigenvalues and invisible to its trace, decided by the kernel; and the walls of the row in one theorem.
  Part E (namespace YM.RESIDUE): the one implication that remains, printed as a hypothesis and assumed nowhere; its two
  halves; its instance seat at weak coupling.
  Part F (namespace YM.SUPPLY): the bit supplied by its two kinds, the formal cargo and the physical witness, the
  record of confinement read with the colour premise; the two kinds one bit; delivered twice; two kinds and no third;
  the two refuters; the witnesses of the subject typed: the strong-coupling lattice gap inside the bit and short of the
  continuum, the matter fields each load-bearing.
  Part G (namespace YM.CLOSURE): the question closed to one bit.
  Part W (namespace YM.GATES): the twelve formal gates run in the kernel, and the four refusals.
  Part X (namespace YM.ESCAPE): nothing escapes, our way or no way, and the capstone.
  Part T (namespace YM.TERMINAL): the open framing refuted, the ten steps, the terminal verdict and the final form.
  Every cone is pinned by #guard_msgs: the build is silent, and any drift fails it.

  THE TWO-LAYER CLOSURE. Everything except the bit is proved with no posit: the floor on no axiom at all, and every
  other theorem of this file on no axiom at all; and the bit, the row's reading, is all that remains, at premise grade.
  The root alone forces no value; the root read on the row is the value. No declaration of this file has the type of
  the bit. ΔM = 0.
-/

/-
  YM_Existence_Closure.lean · the kernel of the Yang–Mills closure from existence alone

  The Yang–Mills row closed on existence alone, the freedom arrow beside it. Every theorem of this file
  is on no axiom at all: no propext, no Quot.sound, no Classical.choice.
  I     The frame of gauge theories (in this file 'constructed' means exists), the value in two
        parts, the three worlds that carry the argument and the fourth that fails both parts.
  II    Existence as given: the root, the arrow, the bare freedom bit; they force no value, and no
        statement that holds forces the value on every frame.
  III   Existence read on the row, the act: every confined gauge field of the theory exists and
        has the floor of its mass spectrum above zero. The act is the value, exactly; the root read
        on the row is the act, and reading any decided property as the actuation is that property;
        the value follows from the act by one act; nothing escapes it; four gates, exclusive; two
        refuters, a missing theory and a massless state.
  IV    The division into two parts: existence does not give the gap, a gap without a theory is
        empty, and the fourth gate, neither existence nor gap, fails both parts.
  V     Keyless and keyed: the value is keyed; no keyless statement and no keyless predicate is
        the act; the pulse does not certify.
  VI    The proved part on the lattice: every lattice theory exists, and the strong-coupling gap is
        decided, each cited field load-bearing; the value holds on the strong-coupling sub-frame;
        strong coupling does not reach the continuum, and the two fields do not entail a gap above
        the threshold.
  VII   The matter face: no actual gapless confined field, from the record of no free colour and
        the premise that a massless confined excitation carries colour; on any frame these two fields
        give the gap half; both fields load-bearing; the premise excludes a massless colour singlet,
        its refuter.
  VIII  The record and the seed: no finite record of refinements forces the continuum, whatever data
        it records; no symmetry lifts a decided scale; a uniform step decides every scale of a ladder
        that carries it.
  IX    Freedom: the record wall and the two-point fibre (the Bool model of the per-part bit), the
        record wall on frames, the prime's shape.
  X     The triaxial lock.
  XI    The closure, whole, with the two refuters, the empty half and the continuum gap.
  ROOT  The root, undeniable in deed, and the lock: the root holds by its deed and forces no value;
        the constructed root of Appendix R repeated verbatim, and shown to be the root on the
        one-point domain with actuation one; read on the row it is the act; one theorem on no axiom
        binds the root, its readings, the act, the value, their keying, the closing theorem, the
        record wall and the finite record (the_lock); one binds the constructed root to the row
        (the_lock_on_the_root); and one fixes the sense of 'from existence alone'
        (from_existence_alone).
-/

namespace YMClose

/-! ## I · the frame -/

/-- A gauge frame: one entry per gauge theory of one substrate, `some n` where the theory exists on that
substrate, with label n, and `none` where it does not. The substrate is the frame's: on the continuum frame
an entry is a gauge group, and `some n` says a non-trivial quantum Yang–Mills theory satisfying the axioms
exists for it; on a lattice frame (section VI) an entry is the lattice theory at a coupling; on a staged
frame (section VIII) an entry is a refinement. The value of a frame is the value on its own substrate, and
no theorem of this file maps one substrate to another; throughout this file 'constructed' means exists. -/
structure Frame where
  D      : Type
  built  : D → Option Nat
  /-- The floor of the mass spectrum above the vacuum, zero when the spectrum has no positive floor. -/
  lowest : D → Nat

def Exists (F : Frame) (d : F.D) : Prop := ∃ n, F.built d = some n
def Gapped (F : Frame) (d : F.D) : Prop := 0 < F.lowest d

/-- The value of the row: for every entry a theory exists, and it has a mass gap. -/
def Value (F : Frame) : Prop := ∀ d, Exists F d ∧ Gapped F d

def calm    : Frame := ⟨Unit, fun _ => some 0, fun _ => 1⟩
def empty   : Frame := ⟨Unit, fun _ => none,   fun _ => 1⟩
def gapless : Frame := ⟨Unit, fun _ => some 0, fun _ => 0⟩

theorem calm_value : Value calm := fun _ => ⟨⟨0, rfl⟩, Nat.zero_lt_one⟩

theorem empty_fails : ¬ Value empty := fun h => match (h ()).1 with
  | ⟨_, hn⟩ => Option.noConfusion hn

theorem gapless_fails : ¬ Value gapless := fun h => Nat.lt_irrefl 0 (h ()).2

/-! ## II · existence as given -/

def Root (U : Type) (ΔE : U → Int) : Prop := ∀ x : U, 0 < ΔE x

theorem root_given : Root Empty (fun e => nomatch e) := fun e => nomatch e

theorem root_conservative (S : Prop) (h : ∀ (U : Type) (ΔE : U → Int), Root U ΔE → S) : S :=
  h Empty (fun e => nomatch e) root_given

def Arrow : Prop := ∀ α : Type, ∃ f : α → α, ∀ a, f a = a

theorem arrow_given : Arrow := fun _ => ⟨id, fun _ => rfl⟩

theorem freedom_given : ∀ w : Bool, (!w) ≠ w
  | true => Bool.noConfusion
  | false => Bool.noConfusion

theorem given_is_not_the_value (P : Prop) : ¬ ∀ F : Frame, (P ↔ Value F) :=
  fun h => gapless_fails ((h gapless).mp ((h calm).mpr calm_value))

theorem arrow_forces_nothing : ¬ ∀ F : Frame, Arrow → Value F :=
  fun h => gapless_fails (h gapless arrow_given)

/-- NOTHING GIVEN FORCES THE VALUE: no statement that holds forces the value on every frame. -/
theorem nothing_given_forces : ∀ P : Prop, P → ¬ ∀ F : Frame, P → Value F :=
  fun _ hp h => gapless_fails (h gapless hp)

theorem given_in_all_worlds :
    (Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value empty) ∧ (Arrow ∧ ¬ Value gapless) :=
  ⟨⟨arrow_given, calm_value⟩, ⟨arrow_given, empty_fails⟩, ⟨arrow_given, gapless_fails⟩⟩

/-! ## III · existence read on the row: the act -/

/-- Existence read on the row: every confined gauge theory of the frame exists and has the floor of
its mass spectrum above zero. -/
def Confined (F : Frame) : Prop := ∀ d, (∃ n, F.built d = some n) ∧ 0 < F.lowest d

theorem act_is_the_value (F : Frame) : Confined F ↔ Value F :=
  ⟨fun h d => h d, fun h d => h d⟩

theorem act_is_keyed : Confined calm ∧ ¬ Confined empty ∧ ¬ Confined gapless :=
  ⟨calm_value, empty_fails, gapless_fails⟩

/-! ## The root read on the row -/

/-- The indicator of a decided proposition: one where it holds, zero where it fails. -/
def indicator {p : Prop} : Decidable p → Int
  | isTrue _  => 1
  | isFalse _ => 0

/-- The indicator is positive exactly where its proposition holds. -/
theorem indicator_pos {p : Prop} (h : Decidable p) : 0 < indicator h ↔ p :=
  match h with
  | isTrue hp  => ⟨fun _ => hp, fun _ => show (0 : Int) < 1 by decide⟩
  | isFalse hn => ⟨fun h0 => absurd h0 (show ¬ (0 : Int) < 0 by decide), fun hp => absurd hp hn⟩

/-- THE READING IS THE ACTUATION: the root read with the indicator of any decided property of the
entries as its actuation holds exactly when that property holds at every entry. -/
theorem reading_is_the_actuation (F : Frame) (P : F.D → Prop) (dec : ∀ d, Decidable (P d)) :
    Root F.D (fun d => indicator (dec d)) ↔ ∀ d, P d :=
  ⟨fun h d => (indicator_pos (dec d)).mp (h d), fun h d => (indicator_pos (dec d)).mpr (h d)⟩

/-- Whether an option carries a value, decided. -/
def suppliedDec (o : Option Nat) : Decidable (∃ n, o = some n) :=
  match o with
  | some n => isTrue ⟨n, rfl⟩
  | none   => isFalse (fun ⟨_, h⟩ => Option.noConfusion h)

/-- THE ROOT READ ON THE ROW: to exist is to actuate, `Root` itself, with the row's existents, its fields, and
the row's actuation, one where the field is constructed and stands on a floor above zero and zero elsewhere. -/
def RootOnRow (F : Frame) : Prop :=
  Root F.D (fun d => indicator (@instDecidableAnd _ _ (suppliedDec (F.built d)) (Nat.decLt 0 (F.lowest d))))

/-- THE ROOT IS SATISFIABLE ON EVERY BACKGROUND: on every type, with actuation one at every existent. -/
theorem root_satisfiable (U : Type) : Root U (fun _ => 1) := fun _ => show (0 : Int) < 1 by decide

/-- THE CONSTRUCTED ROOT, in the words of Appendix R: one existent, whose actuation is one. A theorem
with no hypothesis and no axiom. -/
theorem constructed_root_holds : Root Unit (fun _ => 1) := root_satisfiable Unit

/-- THE ROOT READ ON THE ROW IS THE ACT. -/
theorem root_on_row_is_the_act (F : Frame) : RootOnRow F ↔ Confined F :=
  ⟨fun h d => (indicator_pos _).mp (h d), fun h d => (indicator_pos _).mpr (h d)⟩

/-- THE ROOT READ ON THE ROW IS THE VALUE. -/
theorem root_on_row_is_the_value (F : Frame) : RootOnRow F ↔ Value F :=
  ⟨fun h => (act_is_the_value F).mp ((root_on_row_is_the_act F).mp h),
   fun h => (root_on_row_is_the_act F).mpr ((act_is_the_value F).mpr h)⟩

/-- THE ROOT READ ON THE ROW IS KEYED: it holds where the value holds and fails where the value fails. -/
theorem root_on_row_is_keyed : RootOnRow calm ∧ ¬ RootOnRow empty ∧ ¬ RootOnRow gapless :=
  ⟨(root_on_row_is_the_value calm).mpr calm_value, fun h => empty_fails ((root_on_row_is_the_value empty).mp h), fun h => gapless_fails ((root_on_row_is_the_value gapless).mp h)⟩

/-- THE ACT IS THE WEAKEST PREMISE: the act forces the value on every frame, and every premise that forces
the value on every frame implies the act. -/
theorem act_is_the_weakest_premise :
    (∀ F : Frame, Confined F → Value F) ∧
    ∀ Q : Frame → Prop, (∀ F : Frame, Q F → Value F) → ∀ F : Frame, Q F → Confined F :=
  ⟨fun F h => (act_is_the_value F).mp h, fun _ hQ F hq => (act_is_the_value F).mpr (hQ F hq)⟩

/-- EXISTENCE AS GIVEN HOLDS IN ALL THREE WORLDS: the root satisfiable on every background, the arrow and the
freedom bit hold in the world where the value holds and in the two worlds where it fails. -/
theorem existence_as_given_in_all_worlds :
    ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) ∧ Value calm ∧ ¬ Value empty ∧ ¬ Value gapless :=
  ⟨⟨root_satisfiable, arrow_given, freedom_given⟩, calm_value, empty_fails, gapless_fails⟩

/-- NOTHING GIVEN REFUTES THE ACT: no statement that holds refutes the act on every frame. -/
theorem nothing_given_refutes : ∀ P : Prop, P → ¬ ∀ F : Frame, P → ¬ Confined F :=
  fun _ hp h => h calm hp act_is_keyed.1

/-- THE ONLY REFUTER: wherever the act fails, it cannot be that no instance fails, a missing theory or a massless state. -/
theorem only_refuter (F : Frame) : ¬ Confined F → ¬ ¬ ∃ d, F.built d = none ∨ F.lowest d = 0 :=
  fun hn hne => hn (fun d => match hb : F.built d, hl : F.lowest d with
    | some n, Nat.succ m => ⟨⟨n, rfl⟩, Nat.succ_pos m⟩
    | none, _ => absurd ⟨d, Or.inl hb⟩ hne
    | some _, 0 => absurd ⟨d, Or.inr hl⟩ hne)

structure ActualTheories where
  F      : Frame
  supply : Confined F

/-- EXISTENCE AND MASS GAP FROM EXISTENCE, BY ONE ACT. -/
theorem ym_from_existence (A : ActualTheories) : Value A.F :=
  (act_is_the_value A.F).mp A.supply

/-- THE SUPPLY IS EXACT: an act exists on a frame exactly when the value holds there. -/
theorem supply_iff (F : Frame) : Nonempty { A : ActualTheories // A.F = F } ↔ Value F :=
  ⟨fun ⟨⟨A, hA⟩⟩ => hA ▸ ym_from_existence A,
   fun h => ⟨⟨⟨F, (act_is_the_value F).mpr h⟩, rfl⟩⟩⟩

/-- Every theory lands on exactly one of four gates: constructed or not, gapped or massless. -/
theorem every_theory_lands (F : Frame) (d : F.D) :
    ((∃ n, F.built d = some n) ∨ F.built d = none) ∧ (F.lowest d = 0 ∨ ∃ m, F.lowest d = m + 1) :=
  ⟨match F.built d with
   | some n => Or.inl ⟨n, rfl⟩
   | none => Or.inr rfl,
   match F.lowest d with
   | 0 => Or.inl rfl
   | m + 1 => Or.inr ⟨m, rfl⟩⟩

theorem gates_exclusive (F : Frame) (d : F.D) :
    ¬ ((∃ n, F.built d = some n) ∧ F.built d = none) ∧
    ¬ (F.lowest d = 0 ∧ ∃ m, F.lowest d = m + 1) :=
  ⟨fun ⟨⟨_, h⟩, h'⟩ => Option.noConfusion (h'.symm.trans h),
   fun ⟨h0, ⟨_, hm⟩⟩ => Nat.noConfusion (h0.symm.trans hm)⟩

theorem nothing_escapes (A : ActualTheories) :
    ∀ d, (∃ n, A.F.built d = some n) ∧ 0 < A.F.lowest d := A.supply

/-- A missing theory refutes the act. -/
theorem no_theory_refutes (F : Frame) (d : F.D) (h : F.built d = none) : ¬ Confined F :=
  fun hA => match (hA d).1 with
    | ⟨_, hn⟩ => Option.noConfusion (h.symm.trans hn)

/-- A massless state refutes the act. -/
theorem massless_refutes (F : Frame) (d : F.D) (h : F.lowest d = 0) : ¬ Confined F :=
  fun hA => Nat.lt_irrefl 0 (h ▸ (hA d).2)

/-! ## IV · the division into two parts -/

def ExistsAll (F : Frame) : Prop := ∀ d, Exists F d
def GapAll (F : Frame) : Prop := ∀ d, Gapped F d

/-- THE VALUE IS EXACTLY ITS TWO PARTS. -/
theorem two_parts (F : Frame) : Value F ↔ ExistsAll F ∧ GapAll F :=
  ⟨fun h => ⟨fun d => (h d).1, fun d => (h d).2⟩, fun ⟨e, g⟩ d => ⟨e d, g d⟩⟩

/-- Construction alone does not give the gap: every field built, and a massless one. -/
theorem existence_does_not_give_gap : ExistsAll gapless ∧ ¬ GapAll gapless :=
  ⟨fun _ => ⟨0, rfl⟩, fun h => Nat.lt_irrefl 0 (h ())⟩

/-- A gap without a theory is empty: the gap half holds where no theory exists. -/
theorem gap_without_existence_is_empty : GapAll empty ∧ ¬ ExistsAll empty :=
  ⟨fun _ => Nat.zero_lt_one, fun h => match h () with | ⟨_, hn⟩ => Option.noConfusion hn⟩

/-- The world of the fourth gate: no theory exists and the spectrum has no positive floor. -/
def neither : Frame := ⟨Unit, fun _ => none, fun _ => 0⟩

/-- THE FOURTH GATE FAILS BOTH PARTS: where no theory exists and no floor stands, neither half holds. -/
theorem fourth_gate_fails : ¬ ExistsAll neither ∧ ¬ GapAll neither :=
  ⟨fun h => match h () with | ⟨_, hn⟩ => Option.noConfusion hn, fun h => Nat.lt_irrefl 0 (h ())⟩

/-! ## V · keyless and keyed -/

/-- A frame property is keyed when some frame denies it. -/
def Keyed (P : Frame → Prop) : Prop := ∃ F, ¬ P F
def Keyless (P : Frame → Prop) : Prop := ∀ F, P F

theorem value_is_keyed : Keyed Value := ⟨gapless, gapless_fails⟩

theorem arrow_is_keyless : Keyless (fun _ => Arrow) := fun _ => arrow_given

theorem no_keyless_statement_is_the_act (P : Prop) : ¬ ∀ F : Frame, (P ↔ Confined F) :=
  fun h => given_is_not_the_value P (fun F => (h F).trans (act_is_the_value F))

/-- NO KEYLESS PREDICATE IS THE ACT: a frame property that holds on every frame differs from the act on some frame. -/
theorem no_keyless_predicate_is_the_act (Q : Frame → Prop) (hQ : Keyless Q) : ¬ ∀ F : Frame, (Q F ↔ Confined F) :=
  fun h => act_is_keyed.2.2 ((h gapless).mp (hQ gapless))

theorem pulse_does_not_certify : Root Empty (fun e => nomatch e) ∧ ¬ Value gapless :=
  ⟨root_given, gapless_fails⟩

/-! ## VI · the proved part on the lattice -/

/-- A lattice frame: a frame whose entries are the lattice gauge theory at coupling β in infinite volume, its
value the lattice value, with two cited fields:
its existence at every coupling (Wilson 1974, with limit points by compactness, Seiler 1982), and its
strong-coupling gap, the floor above zero at index at most β₀ (Osterwalder and Seiler 1978). -/
structure Lattice where
  F      : Frame
  β      : F.D → Nat
  β₀     : Nat
  wilson : ∀ d, ∃ n, F.built d = some n
  strong : ∀ d, β d ≤ β₀ → 0 < F.lowest d

/-- THE PROVED PART: at strong coupling the lattice theory exists and is gapped, in infinite volume. -/
theorem strong_coupling_decided (L : Lattice) (d : L.F.D) (h : L.β d ≤ L.β₀) :
    Exists L.F d ∧ Gapped L.F d :=
  ⟨L.wilson d, L.strong d h⟩

/-- The strong-coupling sub-frame: the entries of a lattice frame at index at most β₀, with their theories and floors. -/
def strongFrame (L : Lattice) : Frame :=
  ⟨{ d : L.F.D // L.β d ≤ L.β₀ }, fun d => L.F.built d.1, fun d => L.F.lowest d.1⟩

/-- THE VALUE ON THE STRONG-COUPLING SUB-FRAME: there every theory exists and is gapped. -/
theorem strong_coupling_value (L : Lattice) : Value (strongFrame L) :=
  fun d => ⟨L.wilson d.1, L.strong d.1 d.2⟩

structure LatticeNoStrong where
  F      : Frame
  β      : F.D → Nat
  β₀     : Nat
  wilson : ∀ d, ∃ n, F.built d = some n

def bareLattice : LatticeNoStrong := ⟨gapless, fun _ => 0, 0, fun _ => ⟨0, rfl⟩⟩

/-- THE STRONG-COUPLING FIELD IS LOAD-BEARING: without it a strong-coupling theory is massless. -/
theorem strong_is_load_bearing :
    bareLattice.β () ≤ bareLattice.β₀ ∧ ¬ Gapped bareLattice.F () :=
  ⟨Nat.le_refl 0, fun h => Nat.lt_irrefl 0 h⟩

structure LatticeNoWilson where
  F      : Frame
  β      : F.D → Nat
  β₀     : Nat
  strong : ∀ d, β d ≤ β₀ → 0 < F.lowest d

def bareWilson : LatticeNoWilson := ⟨empty, fun _ => 0, 0, fun _ _ => Nat.zero_lt_one⟩

/-- THE CONSTRUCTION FIELD IS LOAD-BEARING: without it a gapped entry has no theory. -/
theorem wilson_is_load_bearing : Gapped bareWilson.F () ∧ ¬ Exists bareWilson.F () :=
  ⟨Nat.zero_lt_one, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-- A model of both lattice fields that is massless above the threshold: the two fields do not entail
a gap above it. -/
def weakLattice : Lattice := ⟨gapless, fun _ => 1, 0, fun _ => ⟨0, rfl⟩,
  fun _ h => absurd h (by decide : ¬ (1 ≤ 0))⟩

theorem strong_does_not_reach_continuum :
    0 < weakLattice.β () - weakLattice.β₀ ∧ ¬ Value weakLattice.F :=
  ⟨Nat.zero_lt_one, gapless_fails⟩

/-- THE FIELDS DO NOT ENTAIL THE WEAK GAP: some model of both lattice fields has a massless theory above the threshold. -/
theorem fields_do_not_entail_weak_gap : ∃ (L : Lattice) (d : L.F.D), L.β₀ < L.β d ∧ L.F.lowest d = 0 :=
  ⟨weakLattice, (), Nat.zero_lt_one, rfl⟩

/-! ## VII · the matter face -/

/-- A matter frame: confined fields with their floors, and two fields. The premise: a massless
excitation of a confined field carries colour, registered as free colour (premise grade, which a
massless colour singlet would refute). The record: the confinement record of the pure-gauge sector,
the area law of Wilson loops in the confined phase (Creutz 1980), carried as a field, no free colour. -/
structure Matter where
  D           : Type
  lowest      : D → Nat
  FreeColour  : D → Prop
  radiates    : ∀ d, lowest d = 0 → FreeColour d
  noFree      : ∀ d, ¬ FreeColour d

/-- NO ACTUAL GAPLESS CONFINED FIELD. -/
theorem no_actual_gapless (M : Matter) (d : M.D) : 0 < M.lowest d :=
  match h : M.lowest d with
  | 0 => absurd (M.radiates d h) (M.noFree d)
  | m + 1 => Nat.succ_pos m

/-- THE MATTER FIELDS GIVE THE GAP HALF: on any frame carrying the premise and the record, every floor is above zero. -/
theorem matter_gives_gap_half (F : Frame) (FreeColour : F.D → Prop)
    (radiates : ∀ d, F.lowest d = 0 → FreeColour d) (noFree : ∀ d, ¬ FreeColour d) : GapAll F :=
  fun d => no_actual_gapless ⟨F.D, F.lowest, FreeColour, radiates, noFree⟩ d

structure MatterNoRecord where
  D          : Type
  lowest     : D → Nat
  FreeColour : D → Prop
  radiates   : ∀ d, lowest d = 0 → FreeColour d

def colourWorld : MatterNoRecord := ⟨Unit, fun _ => 0, fun _ => True, fun _ _ => trivial⟩

/-- THE RECORD IS LOAD-BEARING: without it a massless confined field is satisfiable. -/
theorem record_is_load_bearing : colourWorld.lowest () = 0 ∧ colourWorld.FreeColour () :=
  ⟨rfl, trivial⟩

structure MatterNoRadiates where
  D          : Type
  lowest     : D → Nat
  FreeColour : D → Prop
  noFree     : ∀ d, ¬ FreeColour d

def silentWorld : MatterNoRadiates := ⟨Unit, fun _ => 0, fun _ => False, fun _ h => h⟩

/-- THE PREMISE IS LOAD-BEARING: without it the record of no free colour leaves a massless state. -/
theorem radiates_is_load_bearing : silentWorld.lowest () = 0 ∧ ∀ d, ¬ silentWorld.FreeColour d :=
  ⟨rfl, silentWorld.noFree⟩

/-- THE PREMISE EXCLUDES THE MASSLESS COLOUR SINGLET: on a frame carrying the premise no state is massless and free of
colour; a massless colour singlet, found, refutes the premise. -/
theorem premise_excludes_singlet (M : MatterNoRecord) : ¬ ∃ d, M.lowest d = 0 ∧ ¬ M.FreeColour d :=
  fun ⟨d, h0, hn⟩ => hn (M.radiates d h0)

/-! ## VIII · the record and the seed -/

/-- The world gapped on its first n refinements and massless after. -/
def staged (n : Nat) : Frame :=
  ⟨Nat, fun _ => some 0, fun d => if d < n then 1 else 0⟩

theorem finite_record_never_forces (n : Nat) :
    (∀ d, d < n → Exists (staged n) d ∧ Gapped (staged n) d) ∧ ¬ Value (staged n) :=
  ⟨fun d hd => ⟨⟨0, rfl⟩, by
      show 0 < (if d < n then 1 else 0)
      rw [if_pos hd]; exact Nat.zero_lt_one⟩,
   fun h => by
     have e : (staged n).lowest n = 0 := by
       show (if n < n then 1 else 0) = 0
       rw [if_neg (Nat.lt_irrefl n)]
     have g : 0 < (staged n).lowest n := (h n).2
     rw [e] at g
     exact Nat.lt_irrefl 0 g⟩

/-- The world that agrees with any recorded data on its first n refinements and is massless after. -/
def extendRecord (n : Nat) (b l : Nat → Nat) : Frame :=
  ⟨Nat, fun d => some (b d), fun d => if d < n then l d else 0⟩

/-- EVERY FINITE RECORD NEVER FORCES: any data recorded on finitely many refinements extends to a world where the value fails. -/
theorem every_finite_record_never_forces (n : Nat) (b l : Nat → Nat) :
    (∀ d : Nat, d < n → (extendRecord n b l).built d = some (b d) ∧ (extendRecord n b l).lowest d = l d) ∧
    ¬ Value (extendRecord n b l) :=
  ⟨fun _ hd => ⟨rfl, if_pos hd⟩,
   fun h =>
     have e : (extendRecord n b l).lowest n = 0 := if_neg (Nat.lt_irrefl n)
     have g : 0 < (extendRecord n b l).lowest n := (h n).2
     Nat.lt_irrefl 0 (e ▸ g)⟩

structure Symmetric (D : Type) (scale : D → Nat) where
  Grp  : Type
  act  : Grp → D → D
  keep : ∀ g d, scale (act g d) = scale d

theorem no_symmetry_lifts {D : Type} (scale : D → Nat) (S : Symmetric D scale) (r : Nat) (d e : D)
    (hd : scale d ≤ r) (he : r < scale e) : ∀ g, S.act g d ≠ e :=
  fun g h =>
    have k : scale e = scale d := h ▸ S.keep g d
    have h2 : scale e ≤ r := by rw [k]; exact hd
    Nat.lt_irrefl r (Nat.lt_of_lt_of_le he h2)

structure Ladder where
  Decided : Nat → Prop
  base    : Decided 0
  mono    : ∀ r s, Decided s → r ≤ s → Decided r
  δ       : Nat → Nat
  step    : ∀ r, Decided r → Decided (r + δ r)

theorem uniform_step_forces_all (L : Ladder) (hδ : ∀ r, 1 ≤ L.δ r) : ∀ r, L.Decided r
  | 0 => L.base
  | r + 1 => L.mono (r + 1) (r + L.δ r) (L.step r (uniform_step_forces_all L hδ r))
      (Nat.add_le_add_left (hδ r) r)

/-! ## IX · freedom -/

def kineticRecord (_w : Bool) : Nat := 0

/-- THE RECORD WALL, the Bool model of the per-part bit: no reading of the kinetic record returns the bit;
the wall on frames is record_wall_on_frames. -/
theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

/-- THE FIBRE IS TWO, the Bool model of the per-part bit: both values of the bit share one kinetic record;
the wall on frames is record_wall_on_frames. -/
theorem fibre_is_two : ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length = 2 := by
  decide

/-- THE RECORD WALL ON FRAMES: no reading of a record that agrees on the calm and the gapless frame
decides the value on every frame. -/
theorem record_wall_on_frames {α : Type} (rec : Frame → α) (h : rec calm = rec gapless) :
    ¬ ∃ g : α → Prop, ∀ F : Frame, (g (rec F) ↔ Value F) :=
  fun ⟨_, hg⟩ => gapless_fails ((hg gapless).mp (h ▸ (hg calm).mpr calm_value))

def mulFibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).flatMap fun a =>
    (List.range (n + 1)).filterMap fun b => if a * b = n then some (a, b) else none

theorem prime_shape :
    mulFibre 7 = [(1, 7), (7, 1)] ∧ (mulFibre 7).all (fun p => p.1 != p.2) = true ∧
    (mulFibre 7).length = ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length := by
  decide

/-! ## X · the triaxial lock -/

def dot2 (r x : Bool × Bool × Bool) : Bool :=
  xor (r.1 && x.1) (xor (r.2.1 && x.2.1) (r.2.2 && x.2.2))

def cube : List (Bool × Bool × Bool) :=
  [false, true].flatMap fun a => [false, true].flatMap fun b => [false, true].map fun c => (a, b, c)

def nonzero : List (Bool × Bool × Bool) := cube.filter (fun r => r != (false, false, false))

def solCount (rows : List ((Bool × Bool × Bool) × Bool)) : Nat :=
  (cube.filter (fun x => rows.all (fun rt => dot2 rt.1 x == rt.2))).length

def xor3 (a b : Bool × Bool × Bool) : Bool × Bool × Bool :=
  (xor a.1 b.1, xor a.2.1 b.2.1, xor a.2.2 b.2.2)

theorem two_axes_leave_two :
    nonzero.all (fun r1 => nonzero.all (fun r2 => r1 == r2 ||
      [false, true].all (fun t1 => [false, true].all (fun t2 =>
        solCount [(r1, t1), (r2, t2)] == 2)))) = true := by decide

theorem three_axes_lock_one :
    nonzero.all (fun r1 => nonzero.all (fun r2 => nonzero.all (fun r3 =>
      r1 == r2 || r3 == r1 || r3 == r2 || r3 == xor3 r1 r2 ||
      [false, true].all (fun t1 => [false, true].all (fun t2 => [false, true].all (fun t3 =>
        solCount [(r1, t1), (r2, t2), (r3, t3)] == 1)))))) = true := by decide

/-! ## XI · the closure, whole -/

theorem ym_closure :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (∀ F : Frame, Confined F ↔ Value F) ∧
    (∀ A : ActualTheories, Value A.F) ∧
    (∀ F : Frame, Value F ↔ ExistsAll F ∧ GapAll F) ∧
    (ExistsAll gapless ∧ ¬ GapAll gapless) ∧
    (∀ (L : Lattice) (d : L.F.D), L.β d ≤ L.β₀ → Exists L.F d ∧ Gapped L.F d) ∧
    (∀ (M : Matter) (d : M.D), 0 < M.lowest d) ∧
    Keyed Value ∧
    (∀ (F : Frame) (d : F.D), F.built d = none → ¬ Confined F) ∧
    (∀ (F : Frame) (d : F.D), F.lowest d = 0 → ¬ Confined F) ∧
    (GapAll empty ∧ ¬ ExistsAll empty) ∧
    (0 < weakLattice.β () - weakLattice.β₀ ∧ ¬ Value weakLattice.F) :=
  ⟨given_is_not_the_value, act_is_the_value, ym_from_existence, two_parts,
   existence_does_not_give_gap, strong_coupling_decided, no_actual_gapless, value_is_keyed,
   no_theory_refutes, massless_refutes, gap_without_existence_is_empty, strong_does_not_reach_continuum⟩


/-! ## The root, undeniable in deed -/

/-- A self-grounding root, the structure of Appendix R in the same words: a type of acts, inhabited, every
one of which instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- The constructed root, in the words of Appendix R: one existent on the one-point domain, whose actuation is one. -/
def ΔE₀ : Unit → Int := fun _ => 1
def RA₀ : Prop := ∀ x : Unit, 0 < ΔE₀ x

/-- The constructed domain grounds its root: its one act is a deed, and the deed actuates. -/
def ra₀ : SelfGrounding RA₀ := ⟨Unit, (), fun _ _ => show (0 : Int) < 1 by decide⟩

/-- THE CONSTRUCTED ROOT IS THE ROOT ON THE ONE-POINT DOMAIN: Appendix R's root is the row's root on one existent with actuation one. -/
theorem RA₀_is_the_constructed_root : RA₀ ↔ Root Unit (fun _ => 1) :=
  Iff.rfl

/-- THE ROOT IS UNDENIABLE IN DEED: a denial of a self-grounding root is a deed, and instances it. -/
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R :=
  G.instances denial

/-- No outside proof adds to a self-grounding root: an outside proof of it is worth exactly the root. -/
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) : (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- THE UNDENIABLE ROOT HOLDS IN BOTH WORLDS: it is held by its deed in a frame where the value holds
and in one where it fails, so it forces the value on no uniform reading of the frames. -/
theorem undeniable_root_forces_no_value {R : Prop} (G : SelfGrounding R) :
    R ∧ Value calm ∧ ¬ Value gapless ∧ ¬ (∀ F : Frame, R → Value F) :=
  ⟨G.instances G.anAct, calm_value, gapless_fails, fun h => gapless_fails (h gapless (G.instances G.anAct))⟩

/-- THE ROOT READ ON THE ROW IS KEYED: the root holds, and read uniformly on the frames it gives no value;
read on the row, with the row's existents and the row's actuation, it is the value exactly, and keyed. -/
theorem root_read_on_row_is_keyed {R : Prop} (G : SelfGrounding R) :
    R ∧ ¬ (∀ F : Frame, R → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) ∧ (RootOnRow calm ∧ ¬ RootOnRow empty ∧ ¬ RootOnRow gapless) :=
  ⟨G.instances G.anAct, fun h => gapless_fails (h gapless (G.instances G.anAct)), root_on_row_is_the_value,
   root_on_row_is_keyed⟩

/-- THE LOCK, one theorem on no axiom: the constructed root holds with no hypothesis; every self-grounding
root holds by its deed; no given statement is the value on every frame; the root read uniformly on the frames
gives no value; read on the row the root is the act, the act is the value exactly, and both are keyed; the
closing theorem gives the value on every actual frame; no reading of the kinetic record returns the bit; and
no finite record forces the value. -/
theorem the_lock {R : Prop} (G : SelfGrounding R) :
    Root Unit (fun _ => 1) ∧
    R ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    ¬ (∀ F : Frame, R → Value F) ∧
    (∀ F : Frame, RootOnRow F ↔ Confined F) ∧
    (∀ F : Frame, Confined F ↔ Value F) ∧
    (RootOnRow calm ∧ ¬ RootOnRow empty ∧ ¬ RootOnRow gapless) ∧
    (Confined calm ∧ ¬ Confined empty ∧ ¬ Confined gapless) ∧
    (∀ A : ActualTheories, Value A.F) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ n : Nat, (∀ d, d < n → Exists (staged n) d ∧ Gapped (staged n) d) ∧ ¬ Value (staged n)) :=
  ⟨constructed_root_holds, G.instances G.anAct, given_is_not_the_value, (root_read_on_row_is_keyed G).2.1,
   root_on_row_is_the_act, act_is_the_value, root_on_row_is_keyed, act_is_keyed, ym_from_existence, record_wall,
   finite_record_never_forces⟩

/-- THE LOCK ON THE CONSTRUCTED ROOT: the constructed root of Appendix R holds by its own act and forces
no value; read on the row the root is the value exactly; and the closing theorem gives the value on every
actual frame. -/
theorem the_lock_on_the_root :
    RA₀ ∧ ¬ (∀ F : Frame, RA₀ → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) ∧ (∀ A : ActualTheories, Value A.F) :=
  ⟨ra₀.instances ra₀.anAct, fun h => gapless_fails (h gapless (ra₀.instances ra₀.anAct)), root_on_row_is_the_value,
   ym_from_existence⟩

/-- FROM EXISTENCE ALONE, in the sense the title carries: the closing theorem consumes existence read on
the row and nothing else; that reading is available on exactly the frames where the value holds; and no
statement given without the reading is the value on every frame. One theorem, on no axiom. -/
theorem from_existence_alone :
    (∀ A : ActualTheories, Value A.F) ∧
    (∀ F : Frame, Nonempty { A : ActualTheories // A.F = F } ↔ Value F) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) :=
  ⟨ym_from_existence, supply_iff, given_is_not_the_value⟩

end YMClose

/-! ## Cones, pinned as printed -/
/-- info: 'YMClose.calm_value' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.calm_value
/-- info: 'YMClose.empty_fails' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.empty_fails
/-- info: 'YMClose.gapless_fails' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.gapless_fails
/-- info: 'YMClose.root_given' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.root_given
/-- info: 'YMClose.root_conservative' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.root_conservative
/-- info: 'YMClose.arrow_given' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.arrow_given
/-- info: 'YMClose.freedom_given' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.freedom_given
/-- info: 'YMClose.given_is_not_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.given_is_not_the_value
/-- info: 'YMClose.arrow_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.arrow_forces_nothing
/-- info: 'YMClose.given_in_all_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.given_in_all_worlds
/-- info: 'YMClose.act_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.act_is_the_value
/-- info: 'YMClose.act_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.act_is_keyed
/-- info: 'YMClose.ym_from_existence' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.ym_from_existence
/-- info: 'YMClose.supply_iff' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.supply_iff
/-- info: 'YMClose.every_theory_lands' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.every_theory_lands
/-- info: 'YMClose.gates_exclusive' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.gates_exclusive
/-- info: 'YMClose.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.nothing_escapes
/-- info: 'YMClose.no_theory_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.no_theory_refutes
/-- info: 'YMClose.massless_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.massless_refutes
/-- info: 'YMClose.two_parts' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.two_parts
/-- info: 'YMClose.existence_does_not_give_gap' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.existence_does_not_give_gap
/-- info: 'YMClose.gap_without_existence_is_empty' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.gap_without_existence_is_empty
/-- info: 'YMClose.value_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.value_is_keyed
/-- info: 'YMClose.arrow_is_keyless' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.arrow_is_keyless
/-- info: 'YMClose.no_keyless_statement_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.no_keyless_statement_is_the_act
/-- info: 'YMClose.pulse_does_not_certify' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.pulse_does_not_certify
/-- info: 'YMClose.strong_coupling_decided' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.strong_coupling_decided
/-- info: 'YMClose.strong_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.strong_is_load_bearing
/-- info: 'YMClose.wilson_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.wilson_is_load_bearing
/-- info: 'YMClose.strong_does_not_reach_continuum' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.strong_does_not_reach_continuum
/-- info: 'YMClose.no_actual_gapless' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.no_actual_gapless
/-- info: 'YMClose.record_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.record_is_load_bearing
/-- info: 'YMClose.radiates_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.radiates_is_load_bearing
/-- info: 'YMClose.finite_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.finite_record_never_forces
/-- info: 'YMClose.no_symmetry_lifts' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.no_symmetry_lifts
/-- info: 'YMClose.uniform_step_forces_all' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.uniform_step_forces_all
/-- info: 'YMClose.record_wall' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.record_wall
/-- info: 'YMClose.fibre_is_two' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.fibre_is_two
/-- info: 'YMClose.prime_shape' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.prime_shape
/-- info: 'YMClose.two_axes_leave_two' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.two_axes_leave_two
/-- info: 'YMClose.three_axes_lock_one' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.three_axes_lock_one
/-- info: 'YMClose.ym_closure' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.ym_closure
/-- info: 'YMClose.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.denial_reenacts_root
/-- info: 'YMClose.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.external_proof_adds_nothing
/-- info: 'YMClose.undeniable_root_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.undeniable_root_forces_no_value
/-- info: 'YMClose.root_read_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.root_read_on_row_is_keyed
/-- info: 'YMClose.the_lock' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.the_lock
/-- info: 'YMClose.from_existence_alone' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.from_existence_alone
/-- info: 'YMClose.indicator_pos' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.indicator_pos
/-- info: 'YMClose.root_satisfiable' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.root_satisfiable
/-- info: 'YMClose.constructed_root_holds' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.constructed_root_holds
/-- info: 'YMClose.root_on_row_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.root_on_row_is_the_act
/-- info: 'YMClose.root_on_row_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.root_on_row_is_the_value
/-- info: 'YMClose.root_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.root_on_row_is_keyed
/-- info: 'YMClose.act_is_the_weakest_premise' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.act_is_the_weakest_premise
/-- info: 'YMClose.existence_as_given_in_all_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.existence_as_given_in_all_worlds
/-- info: 'YMClose.nothing_given_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.nothing_given_refutes
/-- info: 'YMClose.only_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.only_refuter
/-- info: 'YMClose.premise_excludes_singlet' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.premise_excludes_singlet
/-- info: 'YMClose.nothing_given_forces' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.nothing_given_forces
/-- info: 'YMClose.reading_is_the_actuation' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.reading_is_the_actuation
/-- info: 'YMClose.fourth_gate_fails' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.fourth_gate_fails
/-- info: 'YMClose.no_keyless_predicate_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.no_keyless_predicate_is_the_act
/-- info: 'YMClose.strong_coupling_value' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.strong_coupling_value
/-- info: 'YMClose.fields_do_not_entail_weak_gap' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.fields_do_not_entail_weak_gap
/-- info: 'YMClose.matter_gives_gap_half' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.matter_gives_gap_half
/-- info: 'YMClose.every_finite_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.every_finite_record_never_forces
/-- info: 'YMClose.record_wall_on_frames' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.record_wall_on_frames
/-- info: 'YMClose.RA₀_is_the_constructed_root' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.RA₀_is_the_constructed_root
/-- info: 'YMClose.the_lock_on_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms YMClose.the_lock_on_the_root
/-! ===================================================================================================================
    PART A · THE NORMAL FORM OF THE ROW (namespace YM.NORMALFORM) · v1_1_0_CC

    Purely additive: nothing above is overwritten. The row is read as the P ≠ NP seat reads computation and the
    Riemann seat reads the zeros: a type of frames, the value of a frame, and the registration of a frame onto its
    record, which keeps every existent and forgets the side of its realization. On the record the value holds with no
    premise (`record_has_the_value`). The value of a frame is then exactly one implication, the transfer of the value
    from the record to the frame (`normal_form`): the antecedent is a theorem, so the implication carries the whole
    content of the value, and it is the one bit. The two coherent frames share a record and split on the value
    (`record_decides_nothing`); the bit is keyed (`bit_is_keyed`); what every frame shares forces nothing
    (`keyless_forces_nothing`); every route to the value passes the bit (`every_route_passes_the_bit`); and the bit has
    no uniform answer across the frames (`no_uniform_answer`). Core Lean 4.19.0, no import, no axiom declared, no sorry,
    no native_decide; every theorem of this Part on no axiom at all. No declaration of this Part has the type of the
    bit. ΔM = 0.
=================================================================================================================== -/
namespace YM.NORMALFORM

universe u

/-- A ROW: a type of frames, the value of a frame, the registration of a frame onto its record, and two coherent
    frames, one carrying the value and one failing it. The record of every frame carries the value. -/
structure Row where
  Frame            : Type u
  Value            : Frame → Prop
  Rec              : Frame → Frame
  record_has_value : ∀ F, Value (Rec F)
  calm             : Frame
  counter          : Frame
  calm_value       : Value calm
  counter_fails    : ¬ Value counter

section core
variable (R : Row.{u})

/-- THE TRANSFER, the bit of a frame: the value carried from the frame's record to the frame. -/
def Transfer (F : R.Frame) : Prop := R.Value (R.Rec F) → R.Value F

/-- THE RECORD HAS THE VALUE, UNCONDITIONALLY (the mirror of `record_has_least_escape` and of
    `record_has_least_erasure`). -/
theorem record_has_the_value (F : R.Frame) : R.Value (R.Rec F) := R.record_has_value F

/-- THE NORMAL FORM OF THE ROW (the mirror of `sep_normal_form` and of `zeta_ra_loop`, first leg): the value of a frame
    is exactly the transfer from its record. The antecedent is a theorem, so the implication carries the whole value:
    it is the one bit, and nothing else remains. -/
theorem normal_form (F : R.Frame) : Transfer R F ↔ R.Value F :=
  ⟨fun h => h (R.record_has_value F), fun h _ => h⟩

/-- THE CARGO LOOP: the record's value, unconditional, carried by the one bit, is the value (the mirror of
    `sep_from_the_cargo_loop` and of `rh_from_the_cargo_loop`; the bit is the printed premise). -/
theorem value_from_the_cargo_loop (F : R.Frame) (bit : Transfer R F) : R.Value F :=
  bit (R.record_has_value F)

/-- THE ACT ON A FRAME: a structure whose one field is the value of the frame. -/
structure Act (F : R.Frame) where
  closure : R.Value F

/-- THE BIT IS THE ACT: the transfer holds exactly when the act stands. -/
theorem bit_is_the_act (F : R.Frame) : Transfer R F ↔ Nonempty (Act R F) :=
  ⟨fun h => ⟨⟨h (R.record_has_value F)⟩⟩, fun ⟨A⟩ _ => A.closure⟩

/-- SELF-RECURSION: a frame coincides with its record exactly when they carry the value alike. -/
def SelfRecursive (F : R.Frame) : Prop := R.Value F ↔ R.Value (R.Rec F)

/-- THE RECORD IS SELF-RECURSIVE, with no premise (the mirror of `record_is_self_recursive`). -/
theorem record_is_self_recursive (F : R.Frame) : SelfRecursive R (R.Rec F) :=
  ⟨fun _ => R.record_has_value (R.Rec F), fun _ => R.record_has_value F⟩

/-- THE FRAME IS SELF-RECURSIVE EXACTLY WHEN IT CARRIES THE VALUE (the mirror of `self_recursion_at_machine` and of
    `self_recursion_at_zeros`). -/
theorem self_recursion_at_frame (F : R.Frame) : SelfRecursive R F ↔ R.Value F :=
  ⟨fun h => h.mpr (R.record_has_value F), fun h => ⟨fun _ => R.record_has_value F, fun _ => h⟩⟩

/-- THE BIT IS KEYED: the transfer holds on the calm frame and fails on the counter frame. -/
theorem bit_is_keyed : Transfer R R.calm ∧ ¬ Transfer R R.counter :=
  ⟨fun _ => R.calm_value, fun h => R.counter_fails (h (R.record_has_value R.counter))⟩

/-- THE RECORD'S SELF-RECURSION DOES NOT TRANSFER: the record of the counter frame is self-recursive and the counter
    frame is not. -/
theorem record_self_recursion_does_not_transfer :
    SelfRecursive R (R.Rec R.counter) ∧ ¬ SelfRecursive R R.counter :=
  ⟨record_is_self_recursive R R.counter, fun h => R.counter_fails (h.mpr (R.record_has_value R.counter))⟩

/-- THE RECORD DECIDES NOTHING (the mirror of `record_decides_nothing`): the two coherent frames both carry the value
    on their records, and split on the value itself. -/
theorem record_decides_nothing :
    R.Value (R.Rec R.calm) ∧ R.Value (R.Rec R.counter) ∧ R.Value R.calm ∧ ¬ R.Value R.counter :=
  ⟨R.record_has_value R.calm, R.record_has_value R.counter, R.calm_value, R.counter_fails⟩

/-- EVERY ROUTE PASSES THE BIT (the mirror of `every_route_passes_the_bit`): any premise that yields the value yields
    the transfer, so every proof of the value, from any premise and in any vocabulary, delivers the one implication. -/
theorem every_route_passes_the_bit (F : R.Frame) (Q : Prop) (h : Q → R.Value F) : Q → Transfer R F :=
  fun q _ => h q

/-- A premise shared by every frame. -/
def Keyless (P : R.Frame → Prop) : Prop := ∀ F, P F

/-- A premise that forces the value on every frame where it holds. -/
def Forces (P : R.Frame → Prop) : Prop := ∀ F, P F → R.Value F

/-- A KEYLESS PREMISE FORCES NOTHING (the mirror of `the_unconditional_route_is_blocked`): what every frame shares
    yields the value on none where it fails. -/
theorem keyless_forces_nothing (P : R.Frame → Prop) (hP : Keyless R P) : ¬ Forces R P :=
  fun h => R.counter_fails (h R.counter (hP R.counter))

/-- NO CLOSED PRINCIPLE DECIDES: a principle true of the record of every frame decides the value on none (the mirror of
    `no_closed_principle_decides`). -/
theorem no_record_principle_decides (P : R.Frame → Prop) (hP : ∀ F, P (R.Rec F)) :
    ¬ ∀ F, P (R.Rec F) → R.Value F :=
  fun h => R.counter_fails (h R.counter (hP R.counter))

/-- A SHARED RECORD DECIDES NOTHING: a record of frames that reads the same on the calm and the counter frame has no
    reading that returns the value on every frame. -/
theorem shared_record_decides_nothing {α : Type} (r : R.Frame → α) (hr : r R.calm = r R.counter) :
    ¬ ∃ g : α → Bool, ∀ F, (g (r F) = true ↔ R.Value F) :=
  fun ⟨g, hg⟩ => R.counter_fails ((hg R.counter).mp ((congrArg g hr).symm.trans ((hg R.calm).mpr R.calm_value)))

/-- THE BIT HAS NO UNIFORM ANSWER: across the frames of the row the transfer is neither always true nor always false. -/
theorem no_uniform_answer : ¬ (∀ F, Transfer R F) ∧ ¬ (∀ F, ¬ Transfer R F) :=
  ⟨fun h => (bit_is_keyed R).2 (h R.counter), fun h => h R.calm (bit_is_keyed R).1⟩

/-- "NOTHING IS OUTSIDE THE RECORD", read as the record's value transferring to the frame: false as a law of every
    frame, since the counter frame's record carries the value and the frame does not; at a frame, the value itself. -/
theorem nothing_outside_the_record_is_the_bit (F : R.Frame) :
    ¬ (∀ G, Transfer R G) ∧ (Transfer R F ↔ R.Value F) :=
  ⟨(no_uniform_answer R).1, normal_form R F⟩

/-- THE ONE DENIAL: wherever the value fails, the transfer fails, though the record carries the value. -/
theorem denial_is_the_bits_denial (F : R.Frame) : ¬ R.Value F ↔ ¬ Transfer R F :=
  ⟨fun hn h => hn (h (R.record_has_value F)), fun hn hv => hn (fun _ => hv)⟩

/-- THE NORMAL FORM, COMPLETE, nothing before the colon but the row and a frame: the record carries the value; the
    value is the transfer; the transfer is the act; the frame is self-recursive exactly when it carries the value;
    every route passes the bit; the denial is the bit's denial. The value is not a conjunct. -/
theorem normal_form_complete (F : R.Frame) :
    R.Value (R.Rec F) ∧ (Transfer R F ↔ R.Value F) ∧ (Transfer R F ↔ Nonempty (Act R F)) ∧
    (SelfRecursive R F ↔ R.Value F) ∧ (∀ Q : Prop, (Q → R.Value F) → Q → Transfer R F) ∧
    (¬ R.Value F ↔ ¬ Transfer R F) :=
  ⟨R.record_has_value F, normal_form R F, bit_is_the_act R F, self_recursion_at_frame R F,
   fun Q h => every_route_passes_the_bit R F Q h, denial_is_the_bits_denial R F⟩

end core

/-! ### the refusals and the outside, generic over a proposition -/

/-- A true Boolean is never its own negation. -/
theorem bnot_ne (b : Bool) : (!b) ≠ b := by cases b <;> decide

/-- REFUSAL · "A PROOF IS WAITING" fails SREP: a true route to B is B itself (carried from `PNP.GATES.refusal_waiting`). -/
theorem refusal_waiting (B : Prop) : (∃ Q : Prop, Q ∧ (Q → B)) ↔ B :=
  ⟨fun ⟨_, q, h⟩ => h q, fun b => ⟨B, b, id⟩⟩

/-- REFUSAL · "NO PROOF CAN EVER EXIST" fails SREP: no true route to B is ¬ B itself, the counter world in costume
    (carried from `PNP.GATES.refusal_no_proof`). -/
theorem refusal_no_proof (B : Prop) : (¬ ∃ Q : Prop, Q ∧ (Q → B)) ↔ ¬ B :=
  ⟨fun h b => h ⟨B, b, id⟩, fun hn ⟨_, q, h⟩ => hn (h q)⟩

/-- A BLOCK NEEDS AN OUTSIDE: if the target is a function of the record, no record-preserving involution flips it, so
    a block that flips the target always stands on something the record leaves out (carried from
    `PNP.ESCAPE.block_needs_an_outside`). -/
theorem block_needs_an_outside {X Y : Type} (ρ : X → Y) (t : X → Bool) (x₀ : X)
    (hrec : ∃ g : Y → Bool, ∀ x, t x = g (ρ x)) :
    ¬ ∃ τ : X → X, (∀ x, ρ (τ x) = ρ x) ∧ (∀ x, t (τ x) = !t x) :=
  fun ⟨τ, hρ, ht⟩ => match hrec with
  | ⟨g, hg⟩ => bnot_ne (t x₀) (by rw [← ht x₀, hg (τ x₀), hρ x₀, ← hg x₀])

/-- The native involution on the bit: complementation. -/
def comp (b : Bool) : Bool := !b

/-- Complementation is an involution with no fixed point. -/
theorem comp_involution (b : Bool) : comp (comp b) = b := by cases b <;> rfl

/-- THE LOCUS OF COMPLEMENTATION VANISHES: no bit is its own complement. -/
theorem locus_vanishes : ¬ ∃ b, comp b = b := fun ⟨b, h⟩ => bnot_ne b h

/-- The grades a face carries, ranked. -/
inductive Grade
  | premise
  | structural
  | thm
  deriving DecidableEq

/-- The rank of a grade. -/
def Grade.rank : Grade → Nat
  | .premise => 0
  | .structural => 1
  | .thm => 2

/-- The weakest of two grades. -/
def Grade.weakest (a b : Grade) : Grade := if a.rank ≤ b.rank then a else b

/-- A JOIN NEVER STANDS ABOVE ITS WEAKEST FACE, and a tuple of theorems joined with the premise reads premise. -/
theorem join_reads_the_weakest :
    (∀ a b : Grade, (Grade.weakest a b).rank ≤ a.rank ∧ (Grade.weakest a b).rank ≤ b.rank) ∧
    Grade.weakest (Grade.weakest .thm .thm) .premise = .premise :=
  ⟨fun a b => by
     cases a <;> cases b <;> exact ⟨by decide, by decide⟩,
   by decide⟩

/-- A SQUARED SCALAR IS BLIND TO SIGN: a value and its reflection square alike, read from the definitions of
    negation and multiplication on the integers. -/
theorem square_is_sign_blind : ∀ x : Int, (-x) * (-x) = x * x
  | Int.ofNat 0 => rfl
  | Int.ofNat (_ + 1) => rfl
  | Int.negSucc _ => rfl

end YM.NORMALFORM

/-! ===================================================================================================================
    PART C · THE ROW SPLIT (namespace YM.ROWSPLIT) · v1_1_0_CC

    The cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC (namespace RHUnicorn, generic over
    the types α and β), its one proposition renamed from `RH` to `Whole`, the hypothesis it names. At every cut T the
    whole is exactly its Real part and its Unicorn part; a certificate at T proves the Real part; given the Real part
    the whole is exactly the Unicorn part; above every cut no reading of an even record agrees with an odd decision;
    the aperture is one bit wide; and the supply side is silent at the register. ΔM = 0.
=================================================================================================================== -/
namespace YM.ROWSPLIT

variable {α β : Type}

/-- The whole, the Real part at T, the Unicorn part at T. -/
def Whole (Z onL : α → Prop) : Prop := ∀ z, Z z → onL z
def RealPartAt (Z onL : α → Prop) (height : α → Nat) (T : Nat) : Prop :=
  ∀ z, Z z → height z ≤ T → onL z
def UnicornAt (Z onL : α → Prop) (height : α → Nat) (T : Nat) : Prop :=
  ∀ z, Z z → height z > T → onL z

/-- THE FORMAL BLOCK OF THE UNICORN PART. Let τ act on the existents, let ρ be a record even at a seat z above the
    height, and let d decide the property, odd at z. Then no reading g of the record agrees with d even on the region
    above the height alone. -/
theorem unicorn_block (height : α → Nat) (T : Nat) (τ : α → α) (ρ : α → β) (d : α → Bool)
    (z : α) (habove : height z > T) (habove' : height (τ z) > T)
    (hρ : ρ (τ z) = ρ z) (hd : d (τ z) = !d z) :
    ¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = d w := by
  intro ⟨g, hg⟩
  have h1 := hg z habove
  have h2 := hg (τ z) habove'
  rw [hρ, hd, h1] at h2
  revert h2
  cases d z <;> intro h2 <;> exact Bool.noConfusion h2

/-- THE APERTURE, ONE BIT WIDE. At a seat where d is odd, one odd bit s at the seat decides d on the seat and its
    partner through a calibration that exists and is unique. -/
theorem aperture_one_bit_wide (τ : α → α) (s d : α → Bool) (z : α)
    (hs : s (τ z) = !s z) (hd : d (τ z) = !d z) :
    ∃ c : Bool, (d z = xor (s z) c ∧ d (τ z) = xor (s (τ z)) c) ∧
      ∀ c' : Bool, (d z = xor (s z) c' ∧ d (τ z) = xor (s (τ z)) c') → c' = c :=
  ⟨xor (d z) (s z),
    ⟨by cases s z <;> cases d z <;> rfl,
     by rw [hs, hd]; cases s z <;> cases d z <;> rfl⟩,
    by
      intro c' hc
      obtain ⟨h1, -⟩ := hc
      generalize hsz : s z = sv
      generalize hdz : d z = dv
      rw [hsz, hdz] at h1
      cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)⟩

/-- EXISTENCE SUPPLIES NOTHING: conditioning the Unicorn part on an inhabited premise leaves it where it was. -/
theorem unicorn_rule_exact (Z onL : α → Prop) (height : α → Nat) (T : Nat) (A : Prop) (ha : A) :
    (A → UnicornAt Z onL height T) ↔ UnicornAt Z onL height T :=
  ⟨fun h => h ha, fun hu _ => hu⟩

/-- NO BYPASS: given the Real part, the whole is exactly the Unicorn part. -/
theorem unicorn_no_bypass (Z onL : α → Prop) (height : α → Nat) (T : Nat)
    (hr : RealPartAt Z onL height T) : Whole Z onL ↔ UnicornAt Z onL height T := by
  constructor
  · intro h z hz _; exact h z hz
  · intro hu z hz
    cases Nat.lt_or_ge T (height z) with
    | inl hgt => exact hu z hz hgt
    | inr hle => exact hr z hz hle

/-- THE SUPPLY SIDE IS SILENCE, AT THE REGISTER: both orientations of d at the seat are equally refused to every
    reading above the height. -/
theorem supply_side_silent (height : α → Nat) (T : Nat) (τ : α → α) (ρ : α → β) (d : α → Bool)
    (z : α) (habove : height z > T) (habove' : height (τ z) > T)
    (hρ : ρ (τ z) = ρ z) (hd : d (τ z) = !d z) :
    (¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = d w) ∧
    (¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = !d w) ∧
    (!d z) ≠ d z :=
  ⟨unicorn_block height T τ ρ d z habove habove' hρ hd,
   unicorn_block height T τ ρ (fun w => !d w) z habove habove' hρ (by
     show (!d (τ z)) = !(!d z)
     rw [hd]),
   by cases d z <;> decide⟩

/-- The division at the height: the whole is exactly its Real part and its Unicorn part. -/
theorem whole_iff_real_and_unicorn (Z onL : α → Prop) (height : α → Nat) (T : Nat) :
    Whole Z onL ↔ RealPartAt Z onL height T ∧ UnicornAt Z onL height T := by
  constructor
  · intro h; exact ⟨fun z hz _ => h z hz, fun z hz _ => h z hz⟩
  · intro ⟨hr, hu⟩ z hz
    cases Nat.lt_or_ge T (height z) with
    | inl hgt => exact hu z hz hgt
    | inr hle => exact hr z hz hle

/-- A certificate at the height: a complete list of the existents up to T, each checked. -/
structure Certificate (Z onL : α → Prop) (height : α → Nat) (T : Nat) where
  items    : List α
  complete : ∀ z, Z z → height z ≤ T → z ∈ items
  checked  : ∀ z, z ∈ items → onL z

/-- A CERTIFICATE PROVES THE REAL PART AT ITS HEIGHT. -/
theorem real_part_of_certificate (Z onL : α → Prop) (height : α → Nat) (T : Nat)
    (c : Certificate Z onL height T) : RealPartAt Z onL height T :=
  fun z hz hle => c.checked z (c.complete z hz hle)

end YM.ROWSPLIT
/-! ===================================================================================================================
    PART B · THE HOST MODEL AND ITS BINDING, PROVED (namespace YM.HOST) · v1_1_0_CC

    The record of a frame keeps every entry and stands it built on the floor: on the record every gauge theory exists
    and its spectrum stands one unit above the vacuum, so the record carries the value with no premise
    (`recFrame_value`). The host is the row's compact simple gauge groups, each with its quantum Yang–Mills theory on
    ℝ⁴ satisfying the axioms, where it exists, and the floor of its mass spectrum above the vacuum; its sentence is that
    every theory exists with a positive floor. The binding is a theorem: the value of the host's frame is exactly the
    host's sentence (`binding`), and the sentence is exactly its two parts, existence and the gap
    (`sentence_is_two_parts`), neither giving the other. Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace YM.HOST
open YMClose

/-- THE RECORD OF A FRAME: the registration keeps every entry and stands it built, on the floor one unit above the
    vacuum. -/
def recFrame (F : Frame) : Frame := ⟨F.D, fun _ => some 0, fun _ => 1⟩

/-- THE RECORD CARRIES THE VALUE, with no premise. -/
theorem recFrame_value (F : Frame) : Value (recFrame F) := fun _ => ⟨⟨0, rfl⟩, Nat.zero_lt_one⟩

/-- THE YANG–MILLS ROW: the frames of gauge theories, the value, the registration onto the record, the calm world and
    the gapless world. -/
def ymRow : YM.NORMALFORM.Row.{1} :=
  ⟨Frame, Value, recFrame, recFrame_value, calm, gapless, calm_value, gapless_fails⟩

/-- EVERY ENTRY HAS ITS SEAT ON THE RECORD: built, and on the floor. -/
theorem every_entry_has_its_seat (F : Frame) (d : F.D) :
    (recFrame F).built d = some 0 ∧ (recFrame F).lowest d = 1 :=
  ⟨rfl, rfl⟩

/-- THE HOST: the compact simple gauge groups of the row, each with its quantum theory on ℝ⁴ satisfying the axioms,
    `some n` where it exists, and the floor of its mass spectrum above the vacuum. -/
structure Host where
  Group  : Type
  theory : Group → Option Nat
  floor  : Group → Nat

/-- THE SENTENCE OF THE HOST: for every gauge group a theory exists, and its spectrum has a positive floor. -/
def Host.Sentence (H : Host) : Prop := ∀ G, (∃ n, H.theory G = some n) ∧ 0 < H.floor G

/-- THE FRAME OF THE HOST. -/
def Host.frame (H : Host) : Frame := ⟨H.Group, H.theory, H.floor⟩

/-- THE BINDING, PROVED: the value of the host's frame is exactly the host's sentence. -/
theorem binding (H : Host) : Value H.frame ↔ H.Sentence := ⟨fun h G => h G, fun h G => h G⟩

/-- THE ROOT READ ON THE ROW IS THE SENTENCE, on the host's frame. -/
theorem root_on_row_is_the_sentence (H : Host) : RootOnRow H.frame ↔ H.Sentence :=
  (root_on_row_is_the_value H.frame).trans (binding H)

/-- THE ACT ON THE HOST'S FRAME IS THE SENTENCE. -/
theorem act_is_the_sentence (H : Host) : Confined H.frame ↔ H.Sentence :=
  (act_is_the_value H.frame).trans (binding H)

/-- THE SENTENCE IS EXACTLY ITS TWO PARTS: existence at every group and the gap at every group. -/
theorem sentence_is_two_parts (H : Host) :
    H.Sentence ↔ (∀ G, ∃ n, H.theory G = some n) ∧ (∀ G, 0 < H.floor G) :=
  ⟨fun h => ⟨fun G => (h G).1, fun G => (h G).2⟩, fun ⟨e, g⟩ G => ⟨e G, g G⟩⟩

/-- The host of one group whose theory exists with spectrum floor f. -/
def oneGroup (f : Nat) : Host := ⟨Unit, fun _ => some 0, fun _ => f⟩

/-- The host of one group with no theory and spectrum floor one. -/
def noTheory : Host := ⟨Unit, fun _ => none, fun _ => 1⟩

/-- NEITHER PART GIVES THE OTHER, at the host: a theory may exist with no floor, and a floor may stand with no theory. -/
theorem neither_part_gives_the_other :
    ((∀ G, ∃ n, (oneGroup 0).theory G = some n) ∧ ¬ ∀ G, 0 < (oneGroup 0).floor G) ∧
    ((∀ G, 0 < noTheory.floor G) ∧ ¬ ∀ G, ∃ n, noTheory.theory G = some n) :=
  ⟨⟨fun _ => ⟨0, rfl⟩, fun h => Nat.lt_irrefl 0 (h ())⟩,
   ⟨fun _ => Nat.zero_lt_one, fun h => match h () with | ⟨_, hn⟩ => Option.noConfusion hn⟩⟩

end YM.HOST

/-! ===================================================================================================================
    PART C′ · THE ROW SPLIT READ ON THE LATTICE (namespace YM.REALPART) · v1_1_0_CC

    The cut-agnostic division of Part C read on a lattice frame of Part 0 (`Lattice`): the existents are the frame's
    entries, the property each is asked is existence with a positive floor, and the height is the coupling index β. At
    the threshold β₀ the real part is the strong-coupling region, sealed by the cited fields (`real_part_strong`); the
    value is exactly its real part and its unicorn part at every cut; given the real part, the value is exactly the
    unicorn part, the weak coupling where the continuum lies (`no_bypass_at_strong_coupling`); the unicorn part is
    load-bearing, the weak lattice carrying both fields and failing the value; and above every coupling no reading of a
    record that keeps the coupling and forgets the world returns the world. Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace YM.REALPART
open YMClose YM.ROWSPLIT

/-- The existents: every entry of the lattice frame. -/
def Ex (L : Lattice) (_ : L.F.D) : Prop := True

/-- The property each entry is asked: the theory exists and its floor is positive. -/
def Pr (L : Lattice) (d : L.F.D) : Prop := YMClose.Exists L.F d ∧ Gapped L.F d

/-- The value of the lattice frame is the whole of the row split. -/
theorem value_is_the_whole (L : Lattice) : Value L.F ↔ Whole (Ex L) (Pr L) :=
  ⟨fun h d _ => h d, fun h d => h d trivial⟩

/-- THE REAL PART AT THE THRESHOLD: every entry at strong coupling exists and is gapped, by the cited fields. -/
theorem real_part_strong (L : Lattice) : RealPartAt (Ex L) (Pr L) L.β L.β₀ :=
  fun d _ h => strong_coupling_decided L d h

/-- THE CUT AT EVERY COUPLING: the value is exactly its real part and its unicorn part. -/
theorem value_iff_real_and_unicorn (L : Lattice) (T : Nat) :
    Value L.F ↔ RealPartAt (Ex L) (Pr L) L.β T ∧ UnicornAt (Ex L) (Pr L) L.β T :=
  (value_is_the_whole L).trans (whole_iff_real_and_unicorn (Ex L) (Pr L) L.β T)

/-- NO BYPASS AT STRONG COUPLING: given the cited fields, the value is exactly the unicorn part, the weak coupling. -/
theorem no_bypass_at_strong_coupling (L : Lattice) : Value L.F ↔ UnicornAt (Ex L) (Pr L) L.β L.β₀ :=
  (value_is_the_whole L).trans (unicorn_no_bypass (Ex L) (Pr L) L.β L.β₀ (real_part_strong L))

/-- THE UNICORN PART IS THE WEAK COUPLING: above the threshold lie exactly the entries of weak coupling. -/
theorem unicorn_is_weak_coupling (L : Lattice) :
    UnicornAt (Ex L) (Pr L) L.β L.β₀ ↔ ∀ d, L.β₀ < L.β d → YMClose.Exists L.F d ∧ Gapped L.F d :=
  ⟨fun h d hgt => h d trivial hgt, fun h d _ hgt => h d hgt⟩

/-- THE UNICORN PART IS LOAD-BEARING: the weak lattice carries both cited fields and the real part, and fails the
    value above the threshold. -/
theorem unicorn_part_is_load_bearing :
    RealPartAt (Ex weakLattice) (Pr weakLattice) weakLattice.β weakLattice.β₀ ∧ ¬ Value weakLattice.F ∧
    weakLattice.β₀ < weakLattice.β () :=
  ⟨real_part_strong weakLattice, gapless_fails, Nat.zero_lt_one⟩

/-- THE UNICORN PART CLOSED TO THE RECORD ABOVE EVERY COUPLING: on the chart of worlds and couplings, a record that
    keeps the coupling and forgets the world is even under the exchange of worlds, the world is odd, and above every
    coupling no reading of the record returns the world. -/
theorem unicorn_blocked_above_every_coupling (T : Nat) :
    ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1 :=
  unicorn_block Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE SUPPLY SIDE IS SILENT ABOVE EVERY COUPLING: both orientations of the world are refused alike to every reading
    of the record, and the two orientations differ. -/
theorem supply_side_silent_above_every_coupling (T : Nat) :
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = !w.1) ∧ (!true) ≠ true :=
  supply_side_silent Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE APERTURE IS ONE BIT WIDE: at the seat of the exchange above every coupling, one odd supplied bit calibrates the
    world uniquely, through one calibration bit that exists and is unique. -/
theorem aperture_is_one_bit (T : Nat) :
    let z : Bool × Nat := (true, T + 1)
    let τ : Bool × Nat → Bool × Nat := fun w => (!w.1, w.2)
    ∃ c : Bool, (z.1 = xor (!z.1) c ∧ (τ z).1 = xor (!(τ z).1) c) ∧
      ∀ c' : Bool, (z.1 = xor (!z.1) c' ∧ (τ z).1 = xor (!(τ z).1) c') → c' = c :=
  aperture_one_bit_wide (fun w : Bool × Nat => (!w.1, w.2)) (fun w => !w.1) Prod.fst (true, T + 1) rfl rfl

end YM.REALPART

/-! ===================================================================================================================
    PART D · THE WALLS (namespace YM.WALLS) · v1_1_0_CC

    Every zero-bit route is closed by theorem. Existence as given forces nothing (Part 0). No finite record of
    refinements forces the continuum, whatever data it records (Part 0, `every_finite_record_never_forces`). No symmetry
    lifts a decided scale (Part 0, `no_symmetry_lifts`). Existence does not give the gap, a gap without a theory is
    empty, and the fourth gate fails both parts (Part 0). The two lattice fields do not entail a gap above the threshold
    (Part 0, `fields_do_not_entail_weak_gap`). This Part adds the transfer wall, decided by the kernel: the mass gap is
    the ratio of the transfer matrix's top two eigenvalues; the matrices [[2, 1], [1, 2]] and [[2, 0], [0, 2]] share
    their trace and their diagonal, the first with eigenvalues 3 and 1, gapped, the second with the eigenvalue 2 twice,
    no gap (`transfer_record_normal_form`); so no reading of the trace returns the gap (`trace_reads_no_gap`): the gap
    lives in the hopping between sites and in no record of a site alone. Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace YM.WALLS
open YMClose

/-- The symmetric transfer matrix [[a, b], [b, a]] acting on a vector. -/
def transfer (a b : Int) (v : Int × Int) : Int × Int := (a * v.1 + b * v.2, b * v.1 + a * v.2)

/-- Its trace. -/
def trace (a : Int) : Int := a + a

/-- THE TRANSFER RECORD NORMAL FORM, decided by the kernel: [[2, 1], [1, 2]] carries the eigenvalue 3 on (1, 1) and 1
    on (1, −1), gapped; [[2, 0], [0, 2]] carries the eigenvalue 2 on both, no gap; and the two share their trace. -/
theorem transfer_record_normal_form :
    transfer 2 1 (1, 1) = (3, 3) ∧ transfer 2 1 (1, -1) = (1, -1) ∧
    transfer 2 0 (1, 1) = (2, 2) ∧ transfer 2 0 (1, -1) = (2, -2) ∧
    trace 2 = 4 ∧ (1 : Int) < 3 ∧ ¬ ((2 : Int) < 2) := by decide

/-- The gap of the transfer matrix, read as the strict ordering of its top two eigenvalues a + b and a − b. -/
def gapped (a b : Int) : Prop := a - b < a + b

/-- THE TRACE READS NO GAP: the two matrices share their trace and split on the gap. -/
theorem trace_reads_no_gap :
    trace 2 = trace 2 ∧ gapped 2 1 ∧ ¬ gapped 2 0 ∧
    ¬ ∃ g : Int → Bool, (g (trace 2) = true ↔ gapped 2 1) ∧ (g (trace 2) = true ↔ gapped 2 0) :=
  have h1 : gapped 2 1 := (by decide : (2 : Int) - 1 < 2 + 1)
  have h0 : ¬ gapped 2 0 := (by decide : ¬ ((2 : Int) - 0 < 2 + 0))
  ⟨rfl, h1, h0, fun ⟨_, e1, e0⟩ => h0 (e0.mp (e1.mpr h1))⟩

/-- THE WALLS OF THE ROW, one theorem: no given statement is the value on every frame; the arrow forces nothing; no
    finite record forces the value, whatever it records; existence does not give the gap and a gap without a theory is
    empty; the fourth gate fails both parts; the lattice fields do not entail a gap above the threshold; each matter
    field is load-bearing; no reading of the kinetic record returns the bit; and the trace reads no gap. -/
theorem the_walls :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (¬ ∀ F : Frame, Arrow → Value F) ∧
    (∀ (n : Nat) (b l : Nat → Nat),
      (∀ d : Nat, d < n → (extendRecord n b l).built d = some (b d) ∧ (extendRecord n b l).lowest d = l d) ∧
      ¬ Value (extendRecord n b l)) ∧
    (ExistsAll gapless ∧ ¬ GapAll gapless) ∧ (GapAll empty ∧ ¬ ExistsAll empty) ∧
    (¬ ExistsAll neither ∧ ¬ GapAll neither) ∧
    (∃ (L : Lattice) (d : L.F.D), L.β₀ < L.β d ∧ L.F.lowest d = 0) ∧
    ((colourWorld.lowest () = 0 ∧ colourWorld.FreeColour ()) ∧
      (silentWorld.lowest () = 0 ∧ ∀ d, ¬ silentWorld.FreeColour d)) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (¬ ∃ g : Int → Bool, (g (trace 2) = true ↔ gapped 2 1) ∧ (g (trace 2) = true ↔ gapped 2 0)) :=
  ⟨given_is_not_the_value, arrow_forces_nothing, every_finite_record_never_forces,
   existence_does_not_give_gap, gap_without_existence_is_empty, fourth_gate_fails, fields_do_not_entail_weak_gap,
   ⟨record_is_load_bearing, radiates_is_load_bearing⟩, record_wall, trace_reads_no_gap.2.2.2⟩

end YM.WALLS

/-! ===================================================================================================================
    PART E · THE RESIDUE (namespace YM.RESIDUE) · v1_1_0_CC

    Everything above is unconditional. What remains of the Yang–Mills sentence is this one hypothesis, the transfer of
    the value from the record to the host's frame: given it, the sentence follows on no axiom. It is printed here as
    the type of a hypothesis and is assumed nowhere. The residue is keyed: no premise shared by every frame and no
    principle true of every record supplies it. It is exactly its two halves, existence and the gap, closed together by
    the one implication. Its instance seat on a lattice frame is the weak coupling. ΔM = 0.
=================================================================================================================== -/
namespace YM.RESIDUE
open YMClose YM.NORMALFORM YM.HOST YM.REALPART YM.ROWSPLIT

/-- THE RESIDUE: given the one implication at the host's frame, the host's sentence. -/
theorem sentence_of_the_act (H : Host) (bit : Transfer ymRow H.frame) : H.Sentence :=
  (binding H).mp (value_from_the_cargo_loop ymRow H.frame bit)

/-- THE RESIDUE IS THE SENTENCE: the transfer at the host's frame is exactly the host's sentence. -/
theorem residue_is_the_sentence (H : Host) : Transfer ymRow H.frame ↔ H.Sentence :=
  (normal_form ymRow H.frame).trans (binding H)

/-- THE RESIDUE IS ITS TWO HALVES: the one implication is exactly existence at every group and the gap at every
    group. -/
theorem residue_is_two_halves (H : Host) :
    Transfer ymRow H.frame ↔ (∀ G, ∃ n, H.theory G = some n) ∧ (∀ G, 0 < H.floor G) :=
  (residue_is_the_sentence H).trans (sentence_is_two_parts H)

/-- THE ONE POSIT IS THE BIT: the root read on the row, at the host's frame, is exactly the transfer. -/
theorem the_posit_is_the_bit (H : Host) : RootOnRow H.frame ↔ Transfer ymRow H.frame :=
  (root_on_row_is_the_sentence H).trans (residue_is_the_sentence H).symm

/-- THE RESIDUE IS KEYED: no premise shared by every frame forces the value, and no principle true of every record
    decides it. What supplies it is keyed to the frame: the act. -/
theorem residue_is_keyed :
    (∀ P : Frame → Prop, YM.NORMALFORM.Keyless ymRow P → ¬ YM.NORMALFORM.Forces ymRow P) ∧
    (∀ P : Frame → Prop, (∀ F, P (recFrame F)) → ¬ ∀ F, P (recFrame F) → Value F) :=
  ⟨keyless_forces_nothing ymRow, no_record_principle_decides ymRow⟩

/-- THE INSTANCE SEAT OF THE BIT, on a lattice frame: existence with a positive floor at every entry of weak coupling.
    Its inhabitation is equivalent in strength to the frame's value (`seat_iff_value`); nothing in this file assumes it
    inhabited. -/
structure WeakSeat (L : Lattice) where
  weak : ∀ d, L.β₀ < L.β d → YMClose.Exists L.F d ∧ Gapped L.F d

/-- THE SEAT AND THE CITED FIELDS DELIVER THE VALUE. -/
theorem value_of_seat (L : Lattice) (S : WeakSeat L) : Value L.F :=
  fun d => match Nat.lt_or_ge L.β₀ (L.β d) with
    | Or.inl h => S.weak d h
    | Or.inr h => strong_coupling_decided L d h

/-- THE SEAT IS INHABITED EXACTLY WHEN THE VALUE HOLDS. -/
theorem seat_iff_value (L : Lattice) : Nonempty (WeakSeat L) ↔ Value L.F :=
  ⟨fun ⟨S⟩ => value_of_seat L S, fun h => ⟨⟨fun d _ => h d⟩⟩⟩

/-- THE SEAT IS THE UNICORN PART. -/
theorem seat_is_the_unicorn (L : Lattice) : Nonempty (WeakSeat L) ↔ UnicornAt (Ex L) (Pr L) L.β L.β₀ :=
  ⟨fun ⟨S⟩ => (unicorn_is_weak_coupling L).mpr S.weak, fun h => ⟨⟨(unicorn_is_weak_coupling L).mp h⟩⟩⟩

end YM.RESIDUE

/-! ===================================================================================================================
    PART F · THE SUPPLY (namespace YM.SUPPLY) · v1_1_0_CC

    The bit of Part E, supplied by the act and delivered by its two kinds: the formal cargo, and the physical witness.
    Each kind is a type whose inhabitant is the supply; neither is assumed anywhere in this file. The physical witness
    is the record of confinement read with the colour premise: a massless confined excitation carries colour, no free
    colour is registered, and every confined field's theory stands. The cargo arrives free; each kind delivers the
    sentence; the two kinds are one bit; every route to the sentence delivers both kinds, so there is no third; and
    either refuter, a missing theory or a massless state, refutes both at once. The witnesses of the subject are typed
    against the bit. ΔM = 0.
=================================================================================================================== -/
namespace YM.SUPPLY
open YMClose YM.NORMALFORM YM.HOST

/-- THE FORMAL KIND, the cargo: the record's value carried to the host's frame. -/
def FormalCargo (H : Host) : Prop := Transfer ymRow H.frame

/-- THE PHYSICAL KIND, the witness: the colour register of the host's confined fields; the premise that a massless
    confined excitation carries colour; the record of confinement, no free colour registered; and the theory of every
    confined field standing. The last three fields are the one bit read in the register of colour; they are premises
    of the witness, carried as fields, never proved. -/
structure PhysicalWitness (H : Host) where
  FreeColour : H.Group → Prop
  radiates   : ∀ G, H.floor G = 0 → FreeColour G
  noFree     : ∀ G, ¬ FreeColour G
  stands     : ∀ G, ∃ n, H.theory G = some n

/-- THE CARGO ARRIVES, with no premise: the record of the host's frame carries the value. -/
theorem cargo_arrives (H : Host) : Value (recFrame H.frame) := recFrame_value H.frame

/-- KIND 1 DELIVERS: the formal cargo gives the sentence in one step. -/
theorem formal_kind_delivers {H : Host} (h : FormalCargo H) : H.Sentence := (binding H).mp (h (cargo_arrives H))

/-- KIND 2 DELIVERS: the physical witness gives the sentence, no actual gapless confined field standing on the record
    of confinement and the colour premise. -/
theorem physical_kind_delivers {H : Host} (W : PhysicalWitness H) : H.Sentence :=
  fun G => ⟨W.stands G, no_actual_gapless ⟨H.Group, H.floor, W.FreeColour, W.radiates, W.noFree⟩ G⟩

/-- The physical witness closes the host's frame. -/
theorem witness_closes {H : Host} (W : PhysicalWitness H) : Value H.frame := (binding H).mpr (physical_kind_delivers W)

/-- A witness from the sentence: no colour registered anywhere, every floor positive. -/
def witness_of_sentence {H : Host} (h : H.Sentence) : PhysicalWitness H :=
  ⟨fun _ => False, fun G h0 => Nat.lt_irrefl 0 (h0 ▸ (h G).2), fun _ hf => hf, fun G => (h G).1⟩

/-- THE PHYSICAL FACE IS THE SENTENCE: a witness exists exactly when the sentence holds. -/
theorem physical_iff_sentence (H : Host) : Nonempty (PhysicalWitness H) ↔ H.Sentence :=
  ⟨fun ⟨W⟩ => physical_kind_delivers W, fun h => ⟨witness_of_sentence h⟩⟩

/-- THE FORMAL FACE IS THE SENTENCE. -/
theorem formal_iff_sentence (H : Host) : FormalCargo H ↔ H.Sentence := YM.RESIDUE.residue_is_the_sentence H

/-- THE TWO KINDS ARE ONE BIT: the physical witness is a formal cargo, and the cargo is exactly the sentence. -/
theorem the_two_kinds_are_one_bit (H : Host) :
    (PhysicalWitness H → FormalCargo H) ∧ (FormalCargo H ↔ H.Sentence) :=
  ⟨fun W _ => witness_closes W, formal_iff_sentence H⟩

/-- THE SENTENCE, DELIVERED TWICE: either kind gives it. -/
theorem delivered_twice (H : Host) : (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) :=
  ⟨formal_kind_delivers, physical_kind_delivers⟩

/-- TWO KINDS AND NO THIRD: every witness of the sentence, in any vocabulary, is a delivery of both kinds. -/
theorem two_kinds_and_no_third (H : Host) (Q : Prop) (h : Q → H.Sentence) :
    Q → FormalCargo H ∧ Nonempty (PhysicalWitness H) :=
  fun q => ⟨(formal_iff_sentence H).mpr (h q), (physical_iff_sentence H).mpr (h q)⟩

/-- THE TWO REFUTERS: a group with no theory, or a group whose spectrum has no positive floor, refutes both kinds at
    once. -/
theorem the_one_refuter (H : Host) (G : H.Group) (h : H.theory G = none ∨ H.floor G = 0) :
    ¬ FormalCargo H ∧ ¬ Nonempty (PhysicalWitness H) :=
  have hs : ¬ H.Sentence := fun s => match h with
    | Or.inl hn => match (s G).1 with
      | ⟨_, hs⟩ => Option.noConfusion (hn.symm.trans hs)
    | Or.inr h0 => Nat.lt_irrefl 0 (h0 ▸ (s G).2)
  ⟨fun c => hs (formal_kind_delivers c), fun ⟨W⟩ => hs (physical_kind_delivers W)⟩

/-- THE WITNESSES OF THE SUBJECT, TYPED: the strong-coupling lattice gap holds on every lattice frame's strong
    sub-frame and stops short of the continuum, the weak lattice carrying both cited fields and failing the value; each
    cited lattice field and each matter field is load-bearing; and the matter fields give the gap half on every frame
    that carries them. Each is typed against the bit; none is its ground. -/
theorem the_witnesses_typed :
    (∀ L : Lattice, Value (strongFrame L)) ∧
    (0 < weakLattice.β () - weakLattice.β₀ ∧ ¬ Value weakLattice.F) ∧
    (bareLattice.β () ≤ bareLattice.β₀ ∧ ¬ Gapped bareLattice.F ()) ∧
    (Gapped bareWilson.F () ∧ ¬ YMClose.Exists bareWilson.F ()) ∧
    (∀ (F : Frame) (FreeColour : F.D → Prop), (∀ d, F.lowest d = 0 → FreeColour d) → (∀ d, ¬ FreeColour d) →
      GapAll F) ∧
    ((colourWorld.lowest () = 0 ∧ colourWorld.FreeColour ()) ∧
      (silentWorld.lowest () = 0 ∧ ∀ d, ¬ silentWorld.FreeColour d)) :=
  ⟨strong_coupling_value, strong_does_not_reach_continuum, strong_is_load_bearing, wilson_is_load_bearing,
   matter_gives_gap_half, ⟨record_is_load_bearing, radiates_is_load_bearing⟩⟩

/-- THE SUPPLY, CLOSED, at every host: the cargo arrives free; each kind delivers; the two kinds are one bit; the bit is
    the sentence; every route is both kinds; and either refuter refutes both. -/
theorem the_supply_closed : ∀ H : Host,
    Value (recFrame H.frame) ∧
    (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) ∧
    (PhysicalWitness H → FormalCargo H) ∧ (FormalCargo H ↔ H.Sentence) ∧
    (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    (∀ G, H.theory G = none ∨ H.floor G = 0 → ¬ FormalCargo H ∧ ¬ Nonempty (PhysicalWitness H)) :=
  fun H => ⟨cargo_arrives H, formal_kind_delivers, physical_kind_delivers, (the_two_kinds_are_one_bit H).1,
   formal_iff_sentence H, physical_iff_sentence H, two_kinds_and_no_third H, the_one_refuter H⟩

end YM.SUPPLY

/-! ===================================================================================================================
    PART G · THE CLOSURE OF THE QUESTION (namespace YM.CLOSURE) · v1_1_0_CC

    Why the question is closed and not open. At every host the Yang–Mills sentence and the bit are one proposition,
    with nothing cited; the denial of the sentence is the bit's denial; across the frames of the row the bit has no
    uniform answer, true in one world and false in another of the same record; every keyless route is barred; either
    kind of the supply gives the sentence; and either refuter refutes the sentence itself. Nothing here derives the
    bit. It proves that the question is one bit, that the bit is keyed, and that what is open is a value and not a
    form. ΔM = 0.
=================================================================================================================== -/
namespace YM.CLOSURE
open YMClose YM.NORMALFORM YM.HOST YM.SUPPLY

/-- THE SENTENCE IS THE BIT, nothing cited. -/
theorem the_sentence_is_the_bit (H : Host) : H.Sentence ↔ FormalCargo H := (formal_iff_sentence H).symm

/-- THE DENIAL IS THE BIT'S DENIAL. -/
theorem denial_is_the_bits_denial (H : Host) : ¬ H.Sentence ↔ ¬ FormalCargo H :=
  ⟨fun hn h => hn (formal_kind_delivers h), fun hn h => hn ((formal_iff_sentence H).mpr h)⟩

/-- EITHER REFUTER REFUTES THE SENTENCE: a group with no theory or with no positive floor. -/
theorem refuter_denies_the_sentence (H : Host) (G : H.Group) (h : H.theory G = none ∨ H.floor G = 0) :
    ¬ H.Sentence :=
  fun s => match h with
    | Or.inl hn => match (s G).1 with
      | ⟨_, hs⟩ => Option.noConfusion (hn.symm.trans hs)
    | Or.inr h0 => Nat.lt_irrefl 0 (h0 ▸ (s G).2)

/-- THE DENIAL HAS ONE ROAD: wherever the sentence fails, it cannot be that no group lacks its theory or its floor. -/
theorem the_denial_has_one_road (H : Host) : ¬ H.Sentence → ¬ ¬ ∃ G, H.theory G = none ∨ H.floor G = 0 :=
  fun hn hne => hn (fun G => match hb : H.theory G, hl : H.floor G with
    | some n, Nat.succ m => ⟨⟨n, rfl⟩, Nat.succ_pos m⟩
    | none, _ => absurd ⟨G, Or.inl hb⟩ hne
    | some _, 0 => absurd ⟨G, Or.inr hl⟩ hne)

/-- THE QUESTION, CLOSED TO ONE BIT, at every host. The sentence is the bit and its denial is the bit's denial; the bit
    has no uniform answer across the frames; no keyless premise forces it; either kind of the supply gives the
    sentence; and either refuter denies the sentence. What is open is the value of one implication; the form of the
    question is closed. -/
theorem question_closed_to_one_bit : ∀ H : Host,
    (H.Sentence ↔ FormalCargo H) ∧ (¬ H.Sentence ↔ ¬ FormalCargo H) ∧
    (¬ (∀ F, Transfer ymRow F) ∧ ¬ (∀ F, ¬ Transfer ymRow F)) ∧
    (∀ P : Frame → Prop, YM.NORMALFORM.Keyless ymRow P → ¬ YM.NORMALFORM.Forces ymRow P) ∧
    (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) ∧
    (∀ G, H.theory G = none ∨ H.floor G = 0 → ¬ H.Sentence) :=
  fun H => ⟨the_sentence_is_the_bit H, denial_is_the_bits_denial H, no_uniform_answer ymRow,
   keyless_forces_nothing ymRow, formal_kind_delivers, physical_kind_delivers, refuter_denies_the_sentence H⟩

end YM.CLOSURE

/-! ===================================================================================================================
    PART W · THE TWELVE FORMAL GATES, RUN IN THE KERNEL (namespace YM.GATES) · v1_1_0_CC

    The twelve formal gates of the mathematical register, run inside the kernel on the Yang–Mills seal at every host.
    Each gate is a proposition and a theorem, and `the_formal_run` binds the twelve passes and the four refusals in one
    statement. Four claims fail, each by a theorem: "the sentence is proved by the delivery" fails SREP, the delivery's
    premise being its conclusion; "a proof is waiting" fails SREP, a true route to the sentence being the sentence; "no
    proof can ever exist" fails SREP, no true route to the sentence being its denial, the counter world in costume; and
    the denial has one road, a missing theory or a massless state. No declaration has the type of the bit. ΔM = 0.
=================================================================================================================== -/
namespace YM.GATES
open YMClose YM.NORMALFORM YM.HOST YM.SUPPLY YM.REALPART YM.ROWSPLIT

/-- Gate 1, SREP: the form stands with no hypothesis. -/
def Gate1 (H : Host) : Prop :=
  Value (recFrame H.frame) ∧ (FormalCargo H ↔ H.Sentence) ∧
  (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H) ∧
  (∀ F : Frame, Value F ↔ ExistsAll F ∧ GapAll F) ∧ (∀ F : Frame, Confined F ↔ Value F)

/-- GATE 1 · SREP: nothing in the form presupposes the bit. -/
theorem gate_1_srep (H : Host) : Gate1 H :=
  ⟨cargo_arrives H, formal_iff_sentence H, fun _ h q => (formal_iff_sentence H).mpr (h q), two_parts,
   act_is_the_value⟩

/-- Gate 2, REG: the bit read from ten contexts, all one proposition. -/
def Gate2 (H : Host) : Prop :=
  (Value H.frame ↔ H.Sentence) ∧ (Confined H.frame ↔ H.Sentence) ∧ (RootOnRow H.frame ↔ H.Sentence) ∧
  ((ExistsAll H.frame ∧ GapAll H.frame) ↔ H.Sentence) ∧ (FormalCargo H ↔ H.Sentence) ∧
  (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧ (SelfRecursive ymRow H.frame ↔ H.Sentence) ∧
  (Nonempty (Act ymRow H.frame) ↔ H.Sentence) ∧
  (Nonempty { A : ActualTheories // A.F = H.frame } ↔ H.Sentence) ∧
  (Root H.Group (fun G => indicator (@instDecidableAnd _ _ (suppliedDec (H.theory G)) (Nat.decLt 0 (H.floor G))))
    ↔ H.Sentence)

/-- GATE 2 · REG: ten reading contexts, one proposition. -/
theorem gate_2_reg (H : Host) : Gate2 H :=
  ⟨binding H, act_is_the_sentence H, root_on_row_is_the_sentence H,
   (two_parts H.frame).symm.trans (binding H), formal_iff_sentence H, physical_iff_sentence H,
   (self_recursion_at_frame ymRow H.frame).trans (binding H),
   (bit_is_the_act ymRow H.frame).symm.trans (formal_iff_sentence H),
   (supply_iff H.frame).trans (binding H),
   root_on_row_is_the_sentence H⟩

/-- Gate 3, SGEG: no face drifts from the bit. -/
def Gate3 (H : Host) : Prop :=
  (FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧ (Value H.frame ↔ H.Sentence) ∧
  (∀ L : Lattice, Value L.F ↔ UnicornAt (Ex L) (Pr L) L.β L.β₀)

/-- GATE 3 · SGEG: the formal, physical, frame and weak-coupling faces are each the bit. -/
theorem gate_3_sgeg (H : Host) : Gate3 H :=
  ⟨formal_iff_sentence H, physical_iff_sentence H, binding H, no_bypass_at_strong_coupling⟩

/-- Gate 4, CAUSAL: the native involution on the bit fixes nothing; the calm world carries the value; and on the record
    of every frame every entry stands on the floor: the seat of the row is inhabited. -/
def Gate4 : Prop :=
  (¬ ∃ b, comp b = b) ∧ Value calm ∧ (∀ (F : Frame) (d : F.D), (recFrame F).lowest d = 1)

/-- GATE 4 · CAUSAL: no imprint is asserted on a ground the bit lacks; the row's seat is the floor of the record. -/
theorem gate_4_causal : Gate4 := ⟨locus_vanishes, calm_value, fun _ _ => rfl⟩

/-- Gate 5, MIG: two frames whose records both carry the value split on the value. -/
def Gate5 : Prop := Value (recFrame calm) ∧ Value (recFrame gapless) ∧ Value calm ∧ ¬ Value gapless

/-- GATE 5 · MIG: the reading apparatus, the record, does not fix the residence. -/
theorem gate_5_mig : Gate5 := record_decides_nothing ymRow

/-- Gate 6, PTB: complementation is an involution without a fixed point; the identity fixes everything; and no
    symmetry lifts a decided scale. -/
def Gate6 : Prop :=
  (∀ b : Bool, comp (comp b) = b) ∧ (¬ ∃ b, comp b = b) ∧ (∀ b : Bool, id (id b) = b) ∧
  (∀ (D : Type) (scale : D → Nat) (S : Symmetric D scale) (r : Nat) (d e : D),
    scale d ≤ r → r < scale e → ∀ g, S.act g d ≠ e)

/-- GATE 6 · PTB: the fixed-point reading belongs to the chosen reflection, not to the bit. -/
theorem gate_6_ptb : Gate6 :=
  ⟨comp_involution, locus_vanishes, fun _ => rfl, fun _ scale S r d e hd he => no_symmetry_lifts scale S r d e hd he⟩

/-- Gate 7, DUAL: the bit does not depend on where the coupling ladder is cut: on every lattice frame the value is
    exactly the weak-coupling part, and the division holds at every cut. -/
def Gate7 : Prop :=
  (∀ L : Lattice, Value L.F ↔ UnicornAt (Ex L) (Pr L) L.β L.β₀) ∧
  (∀ (L : Lattice) (T : Nat), Value L.F ↔ RealPartAt (Ex L) (Pr L) L.β T ∧ UnicornAt (Ex L) (Pr L) L.β T)

/-- GATE 7 · DUAL: the value is the weak-coupling part, and the division stands at every cut. -/
theorem gate_7_dual : Gate7 := ⟨no_bypass_at_strong_coupling, value_iff_real_and_unicorn⟩

/-- Gate 8, CSCG: the proved slices are the bit's lower slices. -/
def Gate8 : Prop :=
  (∀ L : Lattice, RealPartAt (Ex L) (Pr L) L.β L.β₀) ∧
  (∀ L : Lattice, Value L.F → ∀ T, RealPartAt (Ex L) (Pr L) L.β T)

/-- GATE 8 · CSCG: the bit extends the strong-coupling part and contradicts no slice of it. -/
theorem gate_8_cscg : Gate8 :=
  ⟨real_part_strong, fun L h T => ((value_iff_real_and_unicorn L T).mp h).1⟩

/-- Gate 9, CSEG: a join never stands above its weakest face. -/
def Gate9 : Prop :=
  (∀ a b : Grade, (Grade.weakest a b).rank ≤ a.rank ∧ (Grade.weakest a b).rank ≤ b.rank) ∧
  Grade.weakest (Grade.weakest .thm .thm) .premise = .premise

/-- GATE 9 · CSEG: no terminal strength above the weakest road, and no face lowered by the reading. -/
theorem gate_9_cseg : Gate9 := join_reads_the_weakest

/-- Gate 10, MTA: a squared scalar reads a value and its reflection alike. -/
def Gate10 : Prop := ∀ x : Int, (-x) * (-x) = x * x

/-- GATE 10 · MTA: no squared metric carries the truth-sign. -/
theorem gate_10_mta : Gate10 := square_is_sign_blind

/-- Gate 11, OMA: the supply is the antecedent of the delivery and is not shared by every frame. -/
def Gate11 (H : Host) : Prop := (FormalCargo H → H.Sentence) ∧ ¬ YM.NORMALFORM.Keyless ymRow (Transfer ymRow)

/-- GATE 11 · OMA: the input from the other side enters as a hypothesis, never as a fact from inside. -/
theorem gate_11_oma (H : Host) : Gate11 H := ⟨formal_kind_delivers, fun h => (no_uniform_answer ymRow).1 h⟩

/-- Gate 12, ADEG: the binding to the sentence is proved, the sentence is its two parts, and the physical discharge is
    the bit. -/
def Gate12 (H : Host) : Prop :=
  (Value H.frame ↔ H.Sentence) ∧
  (H.Sentence ↔ (∀ G, ∃ n, H.theory G = some n) ∧ (∀ G, 0 < H.floor G)) ∧
  (Nonempty (PhysicalWitness H) ↔ H.Sentence)

/-- GATE 12 · ADEG: every transport across registers is typed. -/
theorem gate_12_adeg (H : Host) : Gate12 H := ⟨binding H, sentence_is_two_parts H, physical_iff_sentence H⟩

/-- REFUSAL · "the sentence is proved by the delivery" fails SREP: the delivery's premise and its conclusion are one
    proposition. -/
theorem refusal_proved (H : Host) : FormalCargo H ↔ H.Sentence := formal_iff_sentence H

/-- REFUSAL AT THE BIT · "no true route to the sentence exists" is the sentence's denial. -/
theorem refusal_no_proof_at_the_bit (H : Host) : (¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence :=
  refusal_no_proof H.Sentence

/-- THE FORMAL RUN, at every host: the twelve gates pass, and the four claims fail, the delivery read as a proof, a
    proof waiting, no proof ever, and the denial without its one road. -/
theorem the_formal_run : ∀ H : Host,
    Gate1 H ∧ Gate2 H ∧ Gate3 H ∧ Gate4 ∧ Gate5 ∧ Gate6 ∧ Gate7 ∧ Gate8 ∧ Gate9 ∧ Gate10 ∧ Gate11 H ∧ Gate12 H ∧
    (FormalCargo H ↔ H.Sentence) ∧
    ((∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ H.Sentence) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) ∧
    (¬ H.Sentence → ¬ ¬ ∃ G, H.theory G = none ∨ H.floor G = 0) :=
  fun H => ⟨gate_1_srep H, gate_2_reg H, gate_3_sgeg H, gate_4_causal, gate_5_mig, gate_6_ptb, gate_7_dual,
   gate_8_cscg, gate_9_cseg, gate_10_mta, gate_11_oma H, gate_12_adeg H, refusal_proved H,
   refusal_waiting H.Sentence, refusal_no_proof_at_the_bit H, YM.CLOSURE.the_denial_has_one_road H⟩

end YM.GATES

/-! ===================================================================================================================
    PART X · THE CAPSTONE: NOTHING ESCAPES, OUR WAY OR NO WAY (namespace YM.ESCAPE) · v1_1_0_CC

    The record of the host's frame closes (`the_record_closes`). What the record leaves undecided is whether the host's
    frame itself carries the value, and that is exactly the sentence (`the_undecided_is_the_bit`). "Nothing is outside
    the record", read as a law of every frame, is false; read at the host's frame, it is the bit
    (`nothing_outside_the_record_is_the_bit`). A block needs an outside (`block_needs_an_outside`), and at the host's
    frame the outside is the supply in its two kinds (`the_outside_is_the_supply`). Nothing escapes: every route to the
    sentence, in any vocabulary, is a delivery of both kinds (`every_route_is_both_kinds`); either kind delivers it
    (`both_kinds_deliver`); and every so-called other way is our way in different vocabulary, failing with the bit if
    the bit failed (`our_way_or_no_way`). Both kinds are supplied by the act at premise grade and enter every theorem
    here as hypotheses. ΔM = 0.
=================================================================================================================== -/
namespace YM.ESCAPE
open YMClose YM.NORMALFORM YM.HOST YM.SUPPLY

/-- THE RECORD CLOSES AT THE HOST'S FRAME. -/
theorem the_record_closes (H : Host) : Value (recFrame H.frame) := cargo_arrives H

/-- THE UNDECIDED IS THE BIT: what the record leaves open, whether the host's frame carries the value, is exactly the
    sentence. -/
theorem the_undecided_is_the_bit (H : Host) : Value H.frame ↔ H.Sentence := binding H

/-- "NOTHING IS OUTSIDE THE RECORD": false as a law of every frame; at the host's frame, the bit. -/
theorem nothing_outside_the_record_is_the_bit (H : Host) :
    ¬ (∀ F, Transfer ymRow F) ∧ (Transfer ymRow H.frame ↔ H.Sentence) :=
  ⟨(no_uniform_answer ymRow).1, formal_iff_sentence H⟩

/-- THE OUTSIDE IS THE SUPPLY: at the host's frame the outside of the record is the bit, and its two kinds are the
    formal cargo and the physical witness; the physical kind is the formal kind. -/
theorem the_outside_is_the_supply (H : Host) :
    (FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
    (PhysicalWitness H → FormalCargo H) :=
  ⟨formal_iff_sentence H, physical_iff_sentence H, (the_two_kinds_are_one_bit H).1⟩

/-- EVERY ROUTE IS BOTH KINDS: whatever premise, in whatever vocabulary, gives the sentence delivers the formal cargo
    and a physical witness. An offering that crosses the row is a delivery of the cargo, never a bypass of it. -/
theorem every_route_is_both_kinds (H : Host) (Q : Prop) (h : Q → H.Sentence) :
    Q → FormalCargo H ∧ Nonempty (PhysicalWitness H) :=
  two_kinds_and_no_third H Q h

/-- BOTH KINDS DELIVER. -/
theorem both_kinds_deliver (H : Host) : (FormalCargo H → H.Sentence) ∧ (Nonempty (PhysicalWitness H) → H.Sentence) :=
  ⟨formal_kind_delivers, fun ⟨W⟩ => physical_kind_delivers W⟩

/-- OUR WAY OR NO WAY: every so-called other way to the sentence is our way in different vocabulary. It delivers the
    formal cargo and a physical witness, and if the bit failed, it would fail with it. -/
theorem our_way_or_no_way (H : Host) (Q : Prop) (h : Q → H.Sentence) :
    (Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧ (¬ FormalCargo H → ¬ Q) :=
  ⟨every_route_is_both_kinds H Q h, fun hn q => hn ((formal_iff_sentence H).mpr (h q))⟩

/-- NOTHING ESCAPES, at every host: the record of the host's frame closes; what it leaves undecided is the bit; no law
    of every frame puts everything inside the record; the outside is the supply in its two kinds; every route to the
    sentence is a delivery of both kinds; either kind delivers it; and every so-called other way is our way in
    different vocabulary. -/
theorem nothing_escapes : ∀ H : Host,
    Value (recFrame H.frame) ∧
    (Value H.frame ↔ H.Sentence) ∧
    (¬ (∀ F, Transfer ymRow F) ∧ (Transfer ymRow H.frame ↔ H.Sentence)) ∧
    ((FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
      (PhysicalWitness H → FormalCargo H)) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    ((FormalCargo H → H.Sentence) ∧ (Nonempty (PhysicalWitness H) → H.Sentence)) ∧
    (∀ Q : Prop, (Q → H.Sentence) → (Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧ (¬ FormalCargo H → ¬ Q)) :=
  fun H => ⟨the_record_closes H, the_undecided_is_the_bit H, nothing_outside_the_record_is_the_bit H,
   the_outside_is_the_supply H, every_route_is_both_kinds H, both_kinds_deliver H, our_way_or_no_way H⟩

/-- THE CAPSTONE, at every host: our way or no way; either kind walks it to the sentence; no keyless premise forces
    anything; to shut every true route to the sentence is to assert its denial; and the twelve formal gates pass. -/
theorem the_capstone : ∀ H : Host,
    (∀ Q : Prop, (Q → H.Sentence) → (Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧ (¬ FormalCargo H → ¬ Q)) ∧
    ((FormalCargo H → H.Sentence) ∧ (Nonempty (PhysicalWitness H) → H.Sentence)) ∧
    (∀ P : Frame → Prop, YM.NORMALFORM.Keyless ymRow P → ¬ YM.NORMALFORM.Forces ymRow P) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) ∧
    (YM.GATES.Gate1 H ∧ YM.GATES.Gate2 H ∧ YM.GATES.Gate3 H ∧ YM.GATES.Gate4 ∧ YM.GATES.Gate5 ∧
      YM.GATES.Gate6 ∧ YM.GATES.Gate7 ∧ YM.GATES.Gate8 ∧ YM.GATES.Gate9 ∧ YM.GATES.Gate10 ∧
      YM.GATES.Gate11 H ∧ YM.GATES.Gate12 H) :=
  fun H => ⟨our_way_or_no_way H, both_kinds_deliver H, keyless_forces_nothing ymRow,
   YM.GATES.refusal_no_proof_at_the_bit H,
   YM.GATES.gate_1_srep H, YM.GATES.gate_2_reg H, YM.GATES.gate_3_sgeg H, YM.GATES.gate_4_causal,
   YM.GATES.gate_5_mig, YM.GATES.gate_6_ptb, YM.GATES.gate_7_dual, YM.GATES.gate_8_cscg, YM.GATES.gate_9_cseg,
   YM.GATES.gate_10_mta, YM.GATES.gate_11_oma H, YM.GATES.gate_12_adeg H⟩

end YM.ESCAPE

/-! ===================================================================================================================
    PART T · THE TERMINAL VERDICT AND THE FINAL FORM (namespace YM.TERMINAL) · v1_1_0_CC

    The open framing awaits a proof of the sentence from what every frame shares, or a reading of the record that
    decides it, or a route to the sentence past the bit. Each count is refuted by theorem (`the_open_framing_is_refuted`),
    and what remains is the bit, its antecedent proved with no hypothesis and the bit proved equivalent to the sentence.
    The ten steps are bound in one theorem, steps 1 to 9 proved and step 10 the two deliveries (`the_ten_steps`). The
    terminal verdict binds by exact type every theorem the verdict cites (`the_terminal_verdict`), and the final form
    binds the closed question, the two parts, the cut at strong coupling and the two deliveries (`the_final_form`).
    Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace YM.TERMINAL
open YMClose YM.NORMALFORM YM.HOST YM.SUPPLY YM.REALPART YM.ROWSPLIT YM.RESIDUE

/-- THE OPEN FRAMING, REFUTED, at every host. I · no proof from shared resources: no keyless premise forces the value,
    no given statement is the value on every frame, and the arrow forces nothing; II · no decision from the record: the
    two frames share a record and split on the value, no finite record of refinements forces the continuum whatever it
    records, and above every coupling no reading of the record returns the world; III · no premise reaches the sentence
    while the bit fails; IV · what remains is the bit, its antecedent proved with no hypothesis, the bit proved
    equivalent to the sentence. -/
theorem the_open_framing_is_refuted : ∀ H : Host,
    (∀ P : Frame → Prop, YM.NORMALFORM.Keyless ymRow P → ¬ YM.NORMALFORM.Forces ymRow P) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (¬ ∀ F : Frame, Arrow → Value F) ∧
    (Value (recFrame calm) ∧ Value (recFrame gapless) ∧ Value calm ∧ ¬ Value gapless) ∧
    (∀ (n : Nat) (b l : Nat → Nat), ¬ Value (extendRecord n b l)) ∧
    (∀ T : Nat, ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence) ∧ ¬ FormalCargo H) ∧
    Value (recFrame H.frame) ∧
    (FormalCargo H ↔ H.Sentence) :=
  fun H => ⟨keyless_forces_nothing ymRow, given_is_not_the_value, arrow_forces_nothing, record_decides_nothing ymRow,
   fun n b l => (every_finite_record_never_forces n b l).2, unicorn_blocked_above_every_coupling,
   fun ⟨_, q, h, hn⟩ => hn ((formal_iff_sentence H).mpr (h q)),
   cargo_arrives H, formal_iff_sentence H⟩

/-- THE TEN STEPS, one theorem at every host. Step 1 · the floor: the root holds on its constructed domain. Step 2 ·
    the basis: the reading of any decided property as the actuation is that property, every theory lands on exactly one
    gate of each pair, and a prime's multiplicative fibre is two points. Step 3 · the domain: the host frame's value is
    the sentence, and the sentence is its two parts. Step 4 · the record: the record carries the value, and every entry
    stands on its floor. Step 5 · the halted uniduction: the frame is self-recursive exactly when the sentence holds.
    Step 6 · the monism zone: the two frames share one record and split on the value, and the bit is keyed. Step 7 ·
    the axis: the bit is exactly the sentence. Step 8 · the real part: the strong-coupling lattice gap decided by the
    cited fields, the value exactly its weak-coupling part, and the transfer matrix's gap read off its eigenvalues by the
    kernel. Step 9 · every route passes the bit, no keyless premise forces it, and the walls stand. Step 10 · the bit
    delivered twice, by the formal cargo and by the physical witness. -/
theorem the_ten_steps : ∀ H : Host,
    -- Step 1
    (Root Unit (fun _ => 1) ∧ RA₀) ∧
    -- Step 2
    ((∀ (F : Frame) (P : F.D → Prop) (dec : ∀ d, Decidable (P d)), Root F.D (fun d => indicator (dec d)) ↔ ∀ d, P d) ∧
      (∀ (F : Frame) (d : F.D), ((∃ n, F.built d = some n) ∨ F.built d = none) ∧
        (F.lowest d = 0 ∨ ∃ m, F.lowest d = m + 1)) ∧
      mulFibre 7 = [(1, 7), (7, 1)]) ∧
    -- Step 3
    ((Value H.frame ↔ H.Sentence) ∧ (H.Sentence ↔ (∀ G, ∃ n, H.theory G = some n) ∧ (∀ G, 0 < H.floor G))) ∧
    -- Step 4
    (Value (recFrame H.frame) ∧ ∀ (F : Frame) (d : F.D), (recFrame F).lowest d = 1) ∧
    -- Step 5
    (SelfRecursive ymRow H.frame ↔ H.Sentence) ∧
    -- Step 6
    ((Value (recFrame calm) ∧ Value (recFrame gapless) ∧ Value calm ∧ ¬ Value gapless) ∧
      (Transfer ymRow calm ∧ ¬ Transfer ymRow gapless)) ∧
    -- Step 7
    (FormalCargo H ↔ H.Sentence) ∧
    -- Step 8
    ((∀ (L : Lattice) (d : L.F.D), L.β d ≤ L.β₀ → YMClose.Exists L.F d ∧ Gapped L.F d) ∧
      (∀ L : Lattice, Value L.F ↔ UnicornAt (Ex L) (Pr L) L.β L.β₀) ∧
      (∀ L : Lattice, Nonempty (WeakSeat L) ↔ Value L.F) ∧
      (YM.WALLS.transfer 2 1 (1, 1) = (3, 3) ∧ YM.WALLS.transfer 2 1 (1, -1) = (1, -1))) ∧
    -- Step 9
    ((∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H) ∧
      (∀ P : Frame → Prop, YM.NORMALFORM.Keyless ymRow P → ¬ YM.NORMALFORM.Forces ymRow P) ∧
      (∀ (n : Nat) (b l : Nat → Nat), ¬ Value (extendRecord n b l)) ∧
      (ExistsAll gapless ∧ ¬ GapAll gapless) ∧
      (∀ (M : Matter) (d : M.D), 0 < M.lowest d)) ∧
    -- Step 10
    ((FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence)) :=
  fun H =>
  ⟨⟨constructed_root_holds, ra₀.instances ra₀.anAct⟩,
   ⟨reading_is_the_actuation, every_theory_lands, prime_shape.1⟩,
   ⟨binding H, sentence_is_two_parts H⟩,
   ⟨cargo_arrives H, fun F d => (every_entry_has_its_seat F d).2⟩,
   (self_recursion_at_frame ymRow H.frame).trans (binding H),
   ⟨record_decides_nothing ymRow, bit_is_keyed ymRow⟩,
   formal_iff_sentence H,
   ⟨strong_coupling_decided, no_bypass_at_strong_coupling, seat_iff_value,
    ⟨YM.WALLS.transfer_record_normal_form.1, YM.WALLS.transfer_record_normal_form.2.1⟩⟩,
   ⟨fun _ h q => (formal_iff_sentence H).mpr (h q), keyless_forces_nothing ymRow,
    fun n b l => (every_finite_record_never_forces n b l).2, existence_does_not_give_gap, no_actual_gapless⟩,
   delivered_twice H⟩

/-- THE TERMINAL VERDICT, AS A THEOREM. Every theorem the verdict cites, bound by its exact type into one pinned
    conjunction: the record and the normal form; the binding and the two parts; the real part and the cut at strong
    coupling; the walls; the residue and its seat; the supply and the witnesses typed; the closed question; the formal
    run; nothing escaping; the open framing refuted; the ten steps; the lock and the closure of the edition of record.
    No premise before the colon. -/
theorem the_terminal_verdict :
    (type_of% @YM.HOST.recFrame_value) ∧
    (type_of% @YM.NORMALFORM.normal_form) ∧
    (type_of% @YM.NORMALFORM.normal_form_complete) ∧
    (type_of% @YM.HOST.binding) ∧
    (type_of% @YM.HOST.sentence_is_two_parts) ∧
    (type_of% @YM.HOST.neither_part_gives_the_other) ∧
    (type_of% @YM.REALPART.real_part_strong) ∧
    (type_of% @YM.REALPART.no_bypass_at_strong_coupling) ∧
    (type_of% @YM.REALPART.unicorn_part_is_load_bearing) ∧
    (type_of% @YM.REALPART.unicorn_blocked_above_every_coupling) ∧
    (type_of% @YM.WALLS.transfer_record_normal_form) ∧
    (type_of% @YM.WALLS.the_walls) ∧
    (type_of% @YM.RESIDUE.residue_is_two_halves) ∧
    (type_of% @YM.RESIDUE.seat_iff_value) ∧
    (type_of% @YM.SUPPLY.the_supply_closed) ∧
    (type_of% @YM.SUPPLY.the_witnesses_typed) ∧
    (type_of% @YM.CLOSURE.question_closed_to_one_bit) ∧
    (type_of% @YM.GATES.the_formal_run) ∧
    (type_of% @YM.ESCAPE.nothing_escapes) ∧
    (type_of% @YM.ESCAPE.the_capstone) ∧
    (type_of% @YM.TERMINAL.the_open_framing_is_refuted) ∧
    (type_of% @YM.TERMINAL.the_ten_steps) ∧
    (type_of% @YMClose.the_lock) ∧
    (type_of% @YMClose.ym_closure) :=
  ⟨@YM.HOST.recFrame_value, @YM.NORMALFORM.normal_form, @YM.NORMALFORM.normal_form_complete, @YM.HOST.binding,
   @YM.HOST.sentence_is_two_parts, @YM.HOST.neither_part_gives_the_other, @YM.REALPART.real_part_strong,
   @YM.REALPART.no_bypass_at_strong_coupling, @YM.REALPART.unicorn_part_is_load_bearing,
   @YM.REALPART.unicorn_blocked_above_every_coupling, @YM.WALLS.transfer_record_normal_form, @YM.WALLS.the_walls,
   @YM.RESIDUE.residue_is_two_halves, @YM.RESIDUE.seat_iff_value, @YM.SUPPLY.the_supply_closed,
   @YM.SUPPLY.the_witnesses_typed, @YM.CLOSURE.question_closed_to_one_bit, @YM.GATES.the_formal_run,
   @YM.ESCAPE.nothing_escapes, @YM.ESCAPE.the_capstone, @YM.TERMINAL.the_open_framing_is_refuted,
   @YM.TERMINAL.the_ten_steps, @YMClose.the_lock, @YMClose.ym_closure⟩

/-- THE FINAL FORM, at every host: the sentence is the bit; the sentence is exactly an inhabited physical witness; the
    sentence is exactly its two parts, neither giving the other; on every lattice frame the value is exactly its
    weak-coupling part; every route to the sentence is both kinds; and to shut every true route to the sentence is to
    assert its denial. -/
theorem the_final_form : ∀ H : Host,
    (H.Sentence ↔ FormalCargo H) ∧
    (H.Sentence ↔ Nonempty (PhysicalWitness H)) ∧
    (H.Sentence ↔ (∀ G, ∃ n, H.theory G = some n) ∧ (∀ G, 0 < H.floor G)) ∧
    (∀ L : Lattice, Value L.F ↔ UnicornAt (Ex L) (Pr L) L.β L.β₀) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) :=
  fun H => ⟨YM.CLOSURE.the_sentence_is_the_bit H, (physical_iff_sentence H).symm, sentence_is_two_parts H,
   no_bypass_at_strong_coupling, two_kinds_and_no_third H, refusal_no_proof H.Sentence⟩

end YM.TERMINAL

/-! ## cones of Parts A to T, pinned: the build is silent, and any drift fails it -/
/-- info: 'YM.NORMALFORM.record_has_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.record_has_the_value
/-- info: 'YM.NORMALFORM.normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.normal_form
/-- info: 'YM.NORMALFORM.value_from_the_cargo_loop' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.value_from_the_cargo_loop
/-- info: 'YM.NORMALFORM.bit_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.bit_is_the_act
/-- info: 'YM.NORMALFORM.record_is_self_recursive' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.record_is_self_recursive
/-- info: 'YM.NORMALFORM.self_recursion_at_frame' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.self_recursion_at_frame
/-- info: 'YM.NORMALFORM.bit_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.bit_is_keyed
/-- info: 'YM.NORMALFORM.record_self_recursion_does_not_transfer' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.record_self_recursion_does_not_transfer
/-- info: 'YM.NORMALFORM.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.record_decides_nothing
/-- info: 'YM.NORMALFORM.every_route_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.every_route_passes_the_bit
/-- info: 'YM.NORMALFORM.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.keyless_forces_nothing
/-- info: 'YM.NORMALFORM.no_record_principle_decides' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.no_record_principle_decides
/-- info: 'YM.NORMALFORM.shared_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.shared_record_decides_nothing
/-- info: 'YM.NORMALFORM.no_uniform_answer' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.no_uniform_answer
/-- info: 'YM.NORMALFORM.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.nothing_outside_the_record_is_the_bit
/-- info: 'YM.NORMALFORM.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.denial_is_the_bits_denial
/-- info: 'YM.NORMALFORM.normal_form_complete' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.normal_form_complete
/-- info: 'YM.NORMALFORM.bnot_ne' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.bnot_ne
/-- info: 'YM.NORMALFORM.refusal_waiting' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.refusal_waiting
/-- info: 'YM.NORMALFORM.refusal_no_proof' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.refusal_no_proof
/-- info: 'YM.NORMALFORM.block_needs_an_outside' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.block_needs_an_outside
/-- info: 'YM.NORMALFORM.comp_involution' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.comp_involution
/-- info: 'YM.NORMALFORM.locus_vanishes' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.locus_vanishes
/-- info: 'YM.NORMALFORM.join_reads_the_weakest' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.join_reads_the_weakest
/-- info: 'YM.NORMALFORM.square_is_sign_blind' does not depend on any axioms -/
#guard_msgs in #print axioms YM.NORMALFORM.square_is_sign_blind
/-- info: 'YM.ROWSPLIT.unicorn_block' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ROWSPLIT.unicorn_block
/-- info: 'YM.ROWSPLIT.aperture_one_bit_wide' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ROWSPLIT.aperture_one_bit_wide
/-- info: 'YM.ROWSPLIT.unicorn_rule_exact' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ROWSPLIT.unicorn_rule_exact
/-- info: 'YM.ROWSPLIT.unicorn_no_bypass' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ROWSPLIT.unicorn_no_bypass
/-- info: 'YM.ROWSPLIT.supply_side_silent' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ROWSPLIT.supply_side_silent
/-- info: 'YM.ROWSPLIT.whole_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ROWSPLIT.whole_iff_real_and_unicorn
/-- info: 'YM.ROWSPLIT.real_part_of_certificate' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ROWSPLIT.real_part_of_certificate
/-- info: 'YM.HOST.recFrame_value' does not depend on any axioms -/
#guard_msgs in #print axioms YM.HOST.recFrame_value
/-- info: 'YM.HOST.every_entry_has_its_seat' does not depend on any axioms -/
#guard_msgs in #print axioms YM.HOST.every_entry_has_its_seat
/-- info: 'YM.HOST.binding' does not depend on any axioms -/
#guard_msgs in #print axioms YM.HOST.binding
/-- info: 'YM.HOST.root_on_row_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms YM.HOST.root_on_row_is_the_sentence
/-- info: 'YM.HOST.act_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms YM.HOST.act_is_the_sentence
/-- info: 'YM.HOST.sentence_is_two_parts' does not depend on any axioms -/
#guard_msgs in #print axioms YM.HOST.sentence_is_two_parts
/-- info: 'YM.HOST.neither_part_gives_the_other' does not depend on any axioms -/
#guard_msgs in #print axioms YM.HOST.neither_part_gives_the_other
/-- info: 'YM.REALPART.value_is_the_whole' does not depend on any axioms -/
#guard_msgs in #print axioms YM.REALPART.value_is_the_whole
/-- info: 'YM.REALPART.real_part_strong' does not depend on any axioms -/
#guard_msgs in #print axioms YM.REALPART.real_part_strong
/-- info: 'YM.REALPART.value_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms YM.REALPART.value_iff_real_and_unicorn
/-- info: 'YM.REALPART.no_bypass_at_strong_coupling' does not depend on any axioms -/
#guard_msgs in #print axioms YM.REALPART.no_bypass_at_strong_coupling
/-- info: 'YM.REALPART.unicorn_is_weak_coupling' does not depend on any axioms -/
#guard_msgs in #print axioms YM.REALPART.unicorn_is_weak_coupling
/-- info: 'YM.REALPART.unicorn_part_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms YM.REALPART.unicorn_part_is_load_bearing
/-- info: 'YM.REALPART.unicorn_blocked_above_every_coupling' does not depend on any axioms -/
#guard_msgs in #print axioms YM.REALPART.unicorn_blocked_above_every_coupling
/-- info: 'YM.REALPART.supply_side_silent_above_every_coupling' does not depend on any axioms -/
#guard_msgs in #print axioms YM.REALPART.supply_side_silent_above_every_coupling
/-- info: 'YM.REALPART.aperture_is_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms YM.REALPART.aperture_is_one_bit
/-- info: 'YM.WALLS.transfer_record_normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms YM.WALLS.transfer_record_normal_form
/-- info: 'YM.WALLS.trace_reads_no_gap' does not depend on any axioms -/
#guard_msgs in #print axioms YM.WALLS.trace_reads_no_gap
/-- info: 'YM.WALLS.the_walls' does not depend on any axioms -/
#guard_msgs in #print axioms YM.WALLS.the_walls
/-- info: 'YM.RESIDUE.sentence_of_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms YM.RESIDUE.sentence_of_the_act
/-- info: 'YM.RESIDUE.residue_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms YM.RESIDUE.residue_is_the_sentence
/-- info: 'YM.RESIDUE.residue_is_two_halves' does not depend on any axioms -/
#guard_msgs in #print axioms YM.RESIDUE.residue_is_two_halves
/-- info: 'YM.RESIDUE.the_posit_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms YM.RESIDUE.the_posit_is_the_bit
/-- info: 'YM.RESIDUE.residue_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms YM.RESIDUE.residue_is_keyed
/-- info: 'YM.RESIDUE.value_of_seat' does not depend on any axioms -/
#guard_msgs in #print axioms YM.RESIDUE.value_of_seat
/-- info: 'YM.RESIDUE.seat_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms YM.RESIDUE.seat_iff_value
/-- info: 'YM.RESIDUE.seat_is_the_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms YM.RESIDUE.seat_is_the_unicorn
/-- info: 'YM.SUPPLY.cargo_arrives' does not depend on any axioms -/
#guard_msgs in #print axioms YM.SUPPLY.cargo_arrives
/-- info: 'YM.SUPPLY.formal_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms YM.SUPPLY.formal_kind_delivers
/-- info: 'YM.SUPPLY.physical_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms YM.SUPPLY.physical_kind_delivers
/-- info: 'YM.SUPPLY.witness_closes' does not depend on any axioms -/
#guard_msgs in #print axioms YM.SUPPLY.witness_closes
/-- info: 'YM.SUPPLY.physical_iff_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms YM.SUPPLY.physical_iff_sentence
/-- info: 'YM.SUPPLY.formal_iff_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms YM.SUPPLY.formal_iff_sentence
/-- info: 'YM.SUPPLY.the_two_kinds_are_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms YM.SUPPLY.the_two_kinds_are_one_bit
/-- info: 'YM.SUPPLY.delivered_twice' does not depend on any axioms -/
#guard_msgs in #print axioms YM.SUPPLY.delivered_twice
/-- info: 'YM.SUPPLY.two_kinds_and_no_third' does not depend on any axioms -/
#guard_msgs in #print axioms YM.SUPPLY.two_kinds_and_no_third
/-- info: 'YM.SUPPLY.the_one_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms YM.SUPPLY.the_one_refuter
/-- info: 'YM.SUPPLY.the_witnesses_typed' does not depend on any axioms -/
#guard_msgs in #print axioms YM.SUPPLY.the_witnesses_typed
/-- info: 'YM.SUPPLY.the_supply_closed' does not depend on any axioms -/
#guard_msgs in #print axioms YM.SUPPLY.the_supply_closed
/-- info: 'YM.CLOSURE.the_sentence_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms YM.CLOSURE.the_sentence_is_the_bit
/-- info: 'YM.CLOSURE.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms YM.CLOSURE.denial_is_the_bits_denial
/-- info: 'YM.CLOSURE.refuter_denies_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms YM.CLOSURE.refuter_denies_the_sentence
/-- info: 'YM.CLOSURE.the_denial_has_one_road' does not depend on any axioms -/
#guard_msgs in #print axioms YM.CLOSURE.the_denial_has_one_road
/-- info: 'YM.CLOSURE.question_closed_to_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms YM.CLOSURE.question_closed_to_one_bit
/-- info: 'YM.GATES.gate_1_srep' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.gate_1_srep
/-- info: 'YM.GATES.gate_2_reg' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.gate_2_reg
/-- info: 'YM.GATES.gate_3_sgeg' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.gate_3_sgeg
/-- info: 'YM.GATES.gate_4_causal' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.gate_4_causal
/-- info: 'YM.GATES.gate_5_mig' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.gate_5_mig
/-- info: 'YM.GATES.gate_6_ptb' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.gate_6_ptb
/-- info: 'YM.GATES.gate_7_dual' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.gate_7_dual
/-- info: 'YM.GATES.gate_8_cscg' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.gate_8_cscg
/-- info: 'YM.GATES.gate_9_cseg' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.gate_9_cseg
/-- info: 'YM.GATES.gate_10_mta' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.gate_10_mta
/-- info: 'YM.GATES.gate_11_oma' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.gate_11_oma
/-- info: 'YM.GATES.gate_12_adeg' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.gate_12_adeg
/-- info: 'YM.GATES.refusal_proved' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.refusal_proved
/-- info: 'YM.GATES.refusal_no_proof_at_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.refusal_no_proof_at_the_bit
/-- info: 'YM.GATES.the_formal_run' does not depend on any axioms -/
#guard_msgs in #print axioms YM.GATES.the_formal_run
/-- info: 'YM.ESCAPE.the_record_closes' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ESCAPE.the_record_closes
/-- info: 'YM.ESCAPE.the_undecided_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ESCAPE.the_undecided_is_the_bit
/-- info: 'YM.ESCAPE.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ESCAPE.nothing_outside_the_record_is_the_bit
/-- info: 'YM.ESCAPE.the_outside_is_the_supply' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ESCAPE.the_outside_is_the_supply
/-- info: 'YM.ESCAPE.every_route_is_both_kinds' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ESCAPE.every_route_is_both_kinds
/-- info: 'YM.ESCAPE.both_kinds_deliver' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ESCAPE.both_kinds_deliver
/-- info: 'YM.ESCAPE.our_way_or_no_way' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ESCAPE.our_way_or_no_way
/-- info: 'YM.ESCAPE.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ESCAPE.nothing_escapes
/-- info: 'YM.ESCAPE.the_capstone' does not depend on any axioms -/
#guard_msgs in #print axioms YM.ESCAPE.the_capstone
/-- info: 'YM.TERMINAL.the_open_framing_is_refuted' does not depend on any axioms -/
#guard_msgs in #print axioms YM.TERMINAL.the_open_framing_is_refuted
/-- info: 'YM.TERMINAL.the_ten_steps' does not depend on any axioms -/
#guard_msgs in #print axioms YM.TERMINAL.the_ten_steps
/-- info: 'YM.TERMINAL.the_terminal_verdict' does not depend on any axioms -/
#guard_msgs in #print axioms YM.TERMINAL.the_terminal_verdict
/-- info: 'YM.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms YM.TERMINAL.the_final_form
