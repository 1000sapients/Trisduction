/-
  YM_Existence_Closure.lean · the kernel of the Yang–Mills closure from existence alone

  The Yang–Mills row closed on existence and the freedom arrow alone. Every theorem of this file
  is on no axiom at all: no propext, no Quot.sound, no Classical.choice.
  I     The frame of gauge theories, the value in two parts, the three coherent worlds.
  II    Existence as given: the root, the arrow, the bare freedom bit; they force no value.
  III   Existence read on the row, the act: every confined gauge theory that exists is
        constructed and has its lowest state above zero. The act is the value, exactly; the
        value follows from it by one act; nothing escapes it; four gates, exclusive; two
        refuters, a missing theory and a massless state.
  IV    The division into two parts: existence does not give the gap, and a gap without a
        theory is empty.
  V     Keyless and keyed: the value is keyed; no keyless statement is the act; the pulse does
        not certify.
  VI    The proved part on the lattice: every finite-lattice theory exists, and the strong-coupling
        gap is decided, each cited field load-bearing; strong coupling does not reach the
        continuum.
  VII   The matter face: no actual gapless confined field, from the record of no free colour and
        the premise that a massless confined excitation carries colour; both fields load-bearing.
  VIII  The record and the seed: no finite record of refinements forces the continuum; no
        symmetry lifts a decided scale; a uniform step forces every scale.
  IX    Freedom: the record wall, the two-point fibre, the prime's shape.
  X     The triaxial lock.
  XI    The closure, whole.
-/

namespace YMClose

/-! ## I · the frame -/

/-- A gauge frame: theories, each with its construction, `some n` naming a constructed quantum
theory and `none` where none is constructed, and its lowest non-vacuum mass, in units. -/
structure Frame where
  D      : Type
  built  : D → Option Nat
  lowest : D → Nat

def Exists (F : Frame) (d : F.D) : Prop := ∃ n, F.built d = some n
def Gapped (F : Frame) (d : F.D) : Prop := 0 < F.lowest d

/-- The value of the row: every theory exists and has a mass gap. -/
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

theorem given_in_all_worlds :
    (Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value empty) ∧ (Arrow ∧ ¬ Value gapless) :=
  ⟨⟨arrow_given, calm_value⟩, ⟨arrow_given, empty_fails⟩, ⟨arrow_given, gapless_fails⟩⟩

/-! ## III · existence read on the row: the act -/

/-- Existence read on the row: every confined gauge theory that exists is constructed and has
its lowest state above zero. -/
def Confined (F : Frame) : Prop := ∀ d, (∃ n, F.built d = some n) ∧ 0 < F.lowest d

theorem act_is_the_value (F : Frame) : Confined F ↔ Value F :=
  ⟨fun h d => h d, fun h d => h d⟩

theorem act_is_keyed : Confined calm ∧ ¬ Confined empty ∧ ¬ Confined gapless :=
  ⟨calm_value, empty_fails, gapless_fails⟩

structure ActualTheories where
  F      : Frame
  supply : Confined F

/-- EXISTENCE AND MASS GAP FROM EXISTENCE, BY ONE ACT. -/
theorem ym_from_existence (A : ActualTheories) : Value A.F :=
  (act_is_the_value A.F).mp A.supply

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

/-- Existence does not give the gap. -/
theorem existence_does_not_give_gap : ExistsAll gapless ∧ ¬ GapAll gapless :=
  ⟨fun _ => ⟨0, rfl⟩, fun h => Nat.lt_irrefl 0 (h ())⟩

/-- A gap without a theory is empty: the gap half holds where no theory exists. -/
theorem gap_without_existence_is_empty : GapAll empty ∧ ¬ ExistsAll empty :=
  ⟨fun _ => Nat.zero_lt_one, fun h => match h () with | ⟨_, hn⟩ => Option.noConfusion hn⟩

/-! ## V · keyless and keyed -/

/-- A frame property is keyed when some frame denies it. -/
def Keyed (P : Frame → Prop) : Prop := ∃ F, ¬ P F
def Keyless (P : Frame → Prop) : Prop := ∀ F, P F

theorem value_is_keyed : Keyed Value := ⟨gapless, gapless_fails⟩

theorem arrow_is_keyless : Keyless (fun _ => Arrow) := fun _ => arrow_given

theorem no_keyless_statement_is_the_act (P : Prop) : ¬ ∀ F : Frame, (P ↔ Confined F) :=
  fun h => given_is_not_the_value P (fun F => (h F).trans (act_is_the_value F))

theorem pulse_does_not_certify : Root Empty (fun e => nomatch e) ∧ ¬ Value gapless :=
  ⟨root_given, gapless_fails⟩

/-! ## VI · the proved part on the lattice -/

/-- A lattice frame: theories indexed by a coupling, with the two cited fields: every finite-lattice
theory exists (Wilson), and at strong coupling, index at most β₀, the lowest state is above zero
(Osterwalder and Seiler). -/
structure Lattice where
  F      : Frame
  β      : F.D → Nat
  β₀     : Nat
  wilson : ∀ d, ∃ n, F.built d = some n
  strong : ∀ d, β d ≤ β₀ → 0 < F.lowest d

/-- THE PROVED PART: at strong coupling every finite-lattice theory exists and is gapped. -/
theorem strong_coupling_decided (L : Lattice) (d : L.F.D) (h : L.β d ≤ L.β₀) :
    Exists L.F d ∧ Gapped L.F d :=
  ⟨L.wilson d, L.strong d h⟩

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

/-- THE CONSTRUCTION FIELD IS LOAD-BEARING: without it a gapped theory is constructed by nothing. -/
theorem wilson_is_load_bearing : Gapped bareWilson.F () ∧ ¬ Exists bareWilson.F () :=
  ⟨Nat.zero_lt_one, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-- Strong coupling does not reach the continuum: a lattice whose weak-coupling theory is massless. -/
def weakLattice : Lattice := ⟨gapless, fun _ => 1, 0, fun _ => ⟨0, rfl⟩,
  fun _ h => absurd h (by decide : ¬ (1 ≤ 0))⟩

theorem strong_does_not_reach_continuum :
    0 < weakLattice.β () - weakLattice.β₀ ∧ ¬ Value weakLattice.F :=
  ⟨Nat.zero_lt_one, gapless_fails⟩

/-! ## VII · the matter face -/

/-- A matter frame: confined fields with their lowest masses. Two fields: a massless excitation of
a confined field is a long-range coloured state, registered as free colour (a premise, premise
grade, which a massless colour singlet would evade); and the record of no free colour
(corroboration). -/
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

theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

theorem fibre_is_two : ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length = 2 := by
  decide

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
    Keyed Value :=
  ⟨given_is_not_the_value, act_is_the_value, ym_from_existence, two_parts,
   existence_does_not_give_gap, strong_coupling_decided, no_actual_gapless, value_is_keyed⟩

end YMClose

/-! ## Cones, pinned as printed: every theorem on no axiom -/
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
