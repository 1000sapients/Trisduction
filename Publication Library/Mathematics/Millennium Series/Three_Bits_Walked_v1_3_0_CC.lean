/-
  TOE_Zero.lean · Theory of Theories of Everything (TOE of All TOEs): Existence Proves Existence Only by Motion
  The zero-axiom, zero-posit kernel. Core Lean 4: no import, no axiom declared, no sorry, no native_decide, and
  every theorem rests on no axiom at all, not even propositional extensionality, quotients or choice.
  I · The self-grounding root. Acts occur and every act instances the root. Then every denial is an act and
      re-enacts the root, the root is held by the act itself, and no external proof adds anything to it: the
      Omega Boundary, proved for every root that grounds itself, universally, by quantification.
  II · The constructed root. On the constructed domain the Root Axiom is a theorem.
  III · The Return and the line. On the integer quaternions i·j·k = −1 and each unit squares to −1; conjugation is
      an involution and its fixed set on the chart is exactly the scalar line.
  IV · The twelve gates, recovered three ways inside the integers of the quaternions: the twenty-four Hurwitz units
      counted twelve up to sign; the twelve even permutations with class equation 1, 3, 4, 4; and the norm-two
      shell of twenty-four, split twelve and twelve.
  V · The regress terminated. Above a self-grounding root no level grounds it further.
  VI · The master seal, every result bound in one theorem.
-/
namespace TOE0

/-! ## I · The self-grounding root: the Omega Boundary -/

/-- A self-grounding root: acts occur, and every act instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- A proposition whose denial hands it over. -/
def SelfVerifying (P : Prop) : Prop := ¬P → P

/-- THE OMEGA BOUNDARY: every denial of the root is an act, and re-enacts it. -/
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R := G.instances denial

/-- EXISTENCE PROVES EXISTENCE ONLY BY MOTION: the root is held by the act itself. -/
theorem seated_undeniable {R : Prop} (G : SelfGrounding R) : R := G.instances G.anAct

/-- No external proof adds anything to the root. -/
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) : (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- The deed of denying the root hands it over. -/
theorem denial_instantiates {R : Prop} (G : SelfGrounding R) : SelfVerifying R := fun _ => G.instances G.anAct

/-- THE FLOOR IS UNIVERSAL: for every root that grounds itself, the root holds, every act re-enacts it, and no
    external proof adds to it. -/
theorem the_floor_is_universal :
    ∀ (R : Prop) (G : SelfGrounding R), R ∧ (∀ _ : G.Act, R) ∧ (∀ Q : Prop, (Q → R) ↔ R) :=
  fun _ G => ⟨seated_undeniable G, denial_reenacts_root G, external_proof_adds_nothing G⟩

/-! ## II · The constructed root -/

/-- The Root Axiom on the constructed one-point domain: its one existent actuates, at positive energy. -/
def ΔE₀ : Unit → Int := fun _ => 1
def RA₀ : Prop := ∀ x : Unit, 0 < ΔE₀ x

/-- The constructed domain grounds its root: its one act is a deed, and the deed actuates. -/
def ra₀ : SelfGrounding RA₀ := ⟨Unit, (), fun _ _ => show (0 : Int) < 1 by decide⟩

/-- THE ROOT ON THE CONSTRUCTED DOMAIN, A THEOREM. -/
theorem root_on_the_constructed_domain : RA₀ := seated_undeniable ra₀

/-! ## III · The Return and the line -/

structure Q where
  (a b c d : Int)
  deriving DecidableEq

def Q.mul (x y : Q) : Q :=
  ⟨x.a * y.a - x.b * y.b - x.c * y.c - x.d * y.d, x.a * y.b + x.b * y.a + x.c * y.d - x.d * y.c,
   x.a * y.c - x.b * y.d + x.c * y.a + x.d * y.b, x.a * y.d + x.b * y.c - x.c * y.b + x.d * y.a⟩

def Q.conj (x : Q) : Q := ⟨x.a, -x.b, -x.c, -x.d⟩
def qone : Q := ⟨1, 0, 0, 0⟩
def qneg : Q := ⟨-1, 0, 0, 0⟩
def qi : Q := ⟨0, 1, 0, 0⟩
def qj : Q := ⟨0, 0, 1, 0⟩
def qk : Q := ⟨0, 0, 0, 1⟩

/-- THE RETURN: i·j·k = −1. -/
theorem the_return : (qi.mul qj).mul qk = qneg := by decide

/-- Each unit squares to −1. -/
theorem units_square_to_minus_one : qi.mul qi = qneg ∧ qj.mul qj = qneg ∧ qk.mul qk = qneg := by decide

/-- The chart: every quaternion with coordinates in −2 … 2. -/
def chart : List Int := [-2, -1, 0, 1, 2]
def quats : List Q :=
  chart.flatMap fun a => chart.flatMap fun b => chart.flatMap fun c => chart.map fun d => ⟨a, b, c, d⟩

set_option maxRecDepth 100000 in
/-- Conjugation is an involution on the chart. -/
theorem conj_involutive_on_the_chart : quats.all (fun q => q.conj.conj == q) = true := by decide

set_option maxRecDepth 100000 in
/-- THE LINE: conjugation fixes exactly the scalar line on the chart. -/
theorem the_line_is_the_fixed_set :
    quats.all (fun q => (q.conj == q) == (q.b == 0 && q.c == 0 && q.d == 0)) = true := by decide

/-! ## IV · The twelve gates, recovered three ways -/

/-- Hurwitz quaternions in doubled coordinates: all even, or all odd. -/
def hurwitz (a b c d : Int) : Bool :=
  (a % 2 == 0 && b % 2 == 0 && c % 2 == 0 && d % 2 == 0) || (a % 2 != 0 && b % 2 != 0 && c % 2 != 0 && d % 2 != 0)
/-- Doubled coordinates −2 … 2 hold every unit (doubled norm four) and every element of the norm-two shell (doubled
    norm eight), since a doubled coordinate of absolute value three or more already exceeds both norms. -/
def doubled : List (Int × Int × Int × Int) :=
  chart.flatMap fun a => chart.flatMap fun b => chart.flatMap fun c => chart.map fun d => (a, b, c, d)

/-- The Hurwitz units: norm one, doubled norm four. -/
def units : List (Int × Int × Int × Int) :=
  doubled.filter fun (a, b, c, d) => a * a + b * b + c * c + d * d == 4 && hurwitz a b c d

/-- The first nonzero coordinate is positive: one representative of each pair ±u. -/
def upToSign (p : Int × Int × Int × Int) : Bool :=
  let (a, b, c, d) := p
  if a != 0 then 0 < a else if b != 0 then 0 < b else if c != 0 then 0 < c else 0 < d

set_option maxRecDepth 100000 in
/-- FIRST WAY: twenty-four Hurwitz units, twelve up to sign. -/
theorem twenty_four_units_twelve_gates : units.length = 24 ∧ (units.filter upToSign).length = 12 := by decide

/-- The norm-two shell: doubled norm eight. -/
def shell : List (Int × Int × Int × Int) :=
  doubled.filter fun (a, b, c, d) => a * a + b * b + c * c + d * d == 8 && hurwitz a b c d

set_option maxRecDepth 100000 in
/-- THIRD WAY: the norm-two shell has twenty-four elements, split twelve and twelve by sign. -/
theorem the_shell_splits_twelve_and_twelve :
    shell.length = 24 ∧ (shell.filter upToSign).length = 12 ∧ (shell.filter (fun p => !upToSign p)).length = 12 := by
  decide

/-- Permutations of four points, as their lists of images. -/
def perms4 : List (List Nat) :=
  [0, 1, 2, 3].flatMap fun a => [0, 1, 2, 3].flatMap fun b => [0, 1, 2, 3].flatMap fun c =>
    [0, 1, 2, 3].filterMap fun d => if [a, b, c, d].eraseDups.length == 4 then some [a, b, c, d] else none

def inversions (p : List Nat) : Nat :=
  ((List.range 4).flatMap fun i => (List.range 4).map fun j => (i, j)).countP
    fun (i, j) => i < j && p.getD j 0 < p.getD i 0

/-- The twelve gates as the even permutations. -/
def gates : List (List Nat) := perms4.filter fun p => inversions p % 2 == 0

def compose (p q : List Nat) : List Nat := q.map fun i => p.getD i 0
def inverse (p : List Nat) : List Nat := [0, 1, 2, 3].map fun i => p.idxOf i

def conjClass (g : List Nat) : List (List Nat) := (gates.map fun h => compose (compose h g) (inverse h)).eraseDups

def insertSorted (n : Nat) : List Nat → List Nat
  | [] => [n]
  | m :: ms => if n ≤ m then n :: m :: ms else m :: insertSorted n ms

def sortNat (l : List Nat) : List Nat := l.foldr insertSorted []

/-- The class equation from the sorted class size of each element: a class of size s contributes s elements. -/
def collapse : Nat → List Nat → List Nat
  | 0, _ => []
  | _ + 1, [] => []
  | fuel + 1, s :: rest => s :: collapse fuel (rest.drop (s - 1))

set_option maxRecDepth 100000 in
/-- SECOND WAY: the twelve gates, with class equation 1, 3, 4, 4. -/
theorem the_class_equation :
    gates.length = 12 ∧ collapse 12 (sortNat (gates.map fun g => (conjClass g).length)) = [1, 3, 4, 4] := by
  decide

/-! ## V · The regress terminated -/

/-- THE REGRESS ENDS AT THE ROOT: any proposition offered as a further ground of the root is idle; the root needs
    no level above it. -/
theorem no_level_above {R : Prop} (G : SelfGrounding R) : ∀ Q : Prop, (Q → R) → R := fun _ _ => G.instances G.anAct

/-! ## VI · The master seal -/

/-- THE MASTER SEAL: the floor is universal; the root is a theorem on the constructed domain; the Return closes;
    the line is the fixed set; and the twelve gates are recovered three ways. -/
theorem the_master_seal :
    (∀ (R : Prop) (G : SelfGrounding R), R ∧ (∀ _ : G.Act, R) ∧ (∀ Q : Prop, (Q → R) ↔ R)) ∧
    RA₀ ∧ (qi.mul qj).mul qk = qneg ∧
    quats.all (fun q => (q.conj == q) == (q.b == 0 && q.c == 0 && q.d == 0)) = true ∧
    (units.filter upToSign).length = 12 ∧ gates.length = 12 ∧ (shell.filter upToSign).length = 12 ∧
    collapse 12 (sortNat (gates.map fun g => (conjClass g).length)) = [1, 3, 4, 4] :=
  ⟨the_floor_is_universal, root_on_the_constructed_domain, the_return, the_line_is_the_fixed_set,
   twenty_four_units_twelve_gates.2, the_class_equation.1, the_shell_splits_twelve_and_twelve.2.1, the_class_equation.2⟩

end TOE0

/-! ## The zero law, pinned: every cone is empty -/
/-- info: 'TOE0.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.denial_reenacts_root
/-- info: 'TOE0.seated_undeniable' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.seated_undeniable
/-- info: 'TOE0.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.external_proof_adds_nothing
/-- info: 'TOE0.denial_instantiates' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.denial_instantiates
/-- info: 'TOE0.the_floor_is_universal' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.the_floor_is_universal
/-- info: 'TOE0.root_on_the_constructed_domain' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.root_on_the_constructed_domain
/-- info: 'TOE0.the_return' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.the_return
/-- info: 'TOE0.units_square_to_minus_one' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.units_square_to_minus_one
/-- info: 'TOE0.conj_involutive_on_the_chart' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.conj_involutive_on_the_chart
/-- info: 'TOE0.the_line_is_the_fixed_set' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.the_line_is_the_fixed_set
/-- info: 'TOE0.twenty_four_units_twelve_gates' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.twenty_four_units_twelve_gates
/-- info: 'TOE0.the_shell_splits_twelve_and_twelve' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.the_shell_splits_twelve_and_twelve
/-- info: 'TOE0.the_class_equation' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.the_class_equation
/-- info: 'TOE0.no_level_above' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.no_level_above
/-- info: 'TOE0.the_master_seal' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.the_master_seal

/-! ===================================================================================================================
    Three_Bits_Walked_v1_3_0_CC.lean · the kernel of "Three Bits Walked on Seven Seats" · Claude-coded (_CC),
    22 November 2026. Core Lean 4.19.0: no import, no axiom declared, no sorry, no native_decide. Every theorem of
    this file rests on no axiom at all, each cone pinned by #guard_msgs.

    CARRIAGE. Everything above this comment is TOE_Zero.lean, the root kernel, byte for byte
    (sha256 0cfcd9f6b399ecbaef01e762a4d9f10490288f1053827b404428062e55076238, 11,422 B, as deposited with the row
    records). Part T below is appended and changes nothing above it.

    PART T · THE THREE BITS ON THE SEAT (namespace ThreeBits)

    RATIONALE. The arc of the series is three bits on every row: a BLOCK (nothing given decides the row), a HYPOTHESIS
    (exactly one proposition is missing, at one located seat), and a RESOLUTION (the bit enters by deed, and every
    proof lands where the deed lands). The seven row masters prove these three bits row by row, each in its own
    vocabulary. This Part proves them ONCE, on the generic row all seven share in form, so that the paper's ledger of
    seven is seven readings of one theorem and not seven analogies. It then records the standing of the seven rows on
    22 November 2026 as data.

    DESIGN. `Row` is the row of the five host kernels, restated; `Seat` binds the value, the bit and self-recursion.
    Bit 1 is `the_block`, Bit 2 `the_hypothesis`, Bit 3 `the_resolution`; `three_bits_walked` binds them on every row;
    `the_root_alone_decides_nothing` ties the walk to the root of Part R: a root that holds on every frame forces the
    value on none. The ledger is an enumeration compared by `decide`.

    RISKS AND WHAT THIS PART DOES NOT PROVE. The generic row is a form. That each of the seven masters instantiates it
    is proved in those masters, by their own theorems, and is cited from them in the paper; this file imports none of
    them. No declaration here inhabits the Seat of any Millennium row. The standing of the rows is record grade: it is
    data read from the public record on 22 November 2026, and a later event changes the data and no theorem.

    NON-NEGOTIABLES. (1) Three bits, in order, none merged. (2) A foreign proof is always a term before the colon.
    (3) The ledger states what is on record and judges nothing: a conditional refutation is entered as conditional.
    (4) Every cone is pinned; a drift fails the build.
=================================================================================================================== -/
namespace ThreeBits
universe u

/-- A ROW: frames, the value of a frame, the registration of a frame onto its record, and two frames, one carrying
    the value and one failing it. The record of every frame carries the value. -/
structure Row where
  Frame            : Type u
  Value            : Frame → Prop
  Rec              : Frame → Frame
  record_has_value : ∀ F, Value (Rec F)
  calm             : Frame
  counter          : Frame
  calm_value       : Value calm
  counter_fails    : ¬ Value counter

variable (R : Row.{u})

/-- THE BIT of a frame: the value carried from its record to the frame. -/
def Transfer (F : R.Frame) : Prop := R.Value (R.Rec F) → R.Value F

/-- THE SEAT of a frame: the value, the bit, and self-recursion, the frame carrying the value as its record does,
    bound as one proposition. -/
def Seat (F : R.Frame) : Prop := R.Value F ∧ Transfer R F ∧ (R.Value F ↔ R.Value (R.Rec F))

/-- ONE SEAT: the three faces together are the value. -/
theorem one_seat (F : R.Frame) : Seat R F ↔ R.Value F :=
  ⟨fun s => s.1, fun v => ⟨v, fun _ => v, fun _ => R.record_has_value F, fun _ => v⟩⟩

/-- EVERY FACE ALONE IS THE WHOLE SEAT. -/
theorem every_face_is_the_seat (F : R.Frame) :
    (Transfer R F ↔ Seat R F) ∧ ((R.Value F ↔ R.Value (R.Rec F)) ↔ Seat R F) :=
  ⟨⟨fun t => (one_seat R F).mpr (t (R.record_has_value F)), fun s => s.2.1⟩,
   ⟨fun h => (one_seat R F).mpr (h.mpr (R.record_has_value F)), fun s => s.2.2⟩⟩

/-! ## Bit 1 · the block -/

/-- BIT 1, THE BLOCK: nothing given decides the row. No premise that every frame satisfies forces the value; no
    principle true of every record forces it; and the bit is neither true on every frame nor false on every frame. -/
def Block : Prop :=
  (∀ P : R.Frame → Prop, (∀ F, P F) → ¬ ∀ F, P F → R.Value F) ∧
  (∀ P : R.Frame → Prop, (∀ F, P (R.Rec F)) → ¬ ∀ F, P (R.Rec F) → R.Value F) ∧
  (¬ (∀ F, Transfer R F) ∧ ¬ (∀ F, ¬ Transfer R F))

theorem the_block : Block R :=
  ⟨fun _ hP h => R.counter_fails (h R.counter (hP R.counter)),
   fun _ hP h => R.counter_fails (h R.counter (hP R.counter)),
   fun h => R.counter_fails (h R.counter (R.record_has_value R.counter)),
   fun h => h R.calm (fun _ => R.calm_value)⟩

/-! ## Bit 2 · the hypothesis -/

/-- BIT 2, THE HYPOTHESIS: exactly one proposition is missing, at one seat. On every frame the Seat is one
    proposition with the value; the record carries the value on every frame, so the record leaves exactly the Seat
    open; and both orientations of the Seat occur, on the calm frame and on the counter frame. -/
def Hypothesis : Prop :=
  (∀ F, Seat R F ↔ R.Value F) ∧ (∀ F, R.Value (R.Rec F)) ∧ Seat R R.calm ∧ ¬ Seat R R.counter

theorem the_hypothesis : Hypothesis R :=
  ⟨one_seat R, R.record_has_value, (one_seat R R.calm).mpr R.calm_value, fun s => R.counter_fails s.1⟩

/-! ## Bit 3 · the resolution -/

/-- BIT 3, THE RESOLUTION: the bit enters by deed, and every proof lands where the deed lands. On every frame: the
    bit supplied gives the value; every premise that gives the value gives the Seat, and fails if the Seat fails;
    and every premise that refutes the value refutes the Seat. -/
def Resolution : Prop :=
  ∀ F, (Transfer R F → R.Value F) ∧
       (∀ Q : Prop, (Q → R.Value F) → (Q → Seat R F) ∧ (¬ Seat R F → ¬ Q)) ∧
       (∀ P : Prop, (P → ¬ R.Value F) → P → ¬ Seat R F)

theorem the_resolution : Resolution R :=
  fun F => ⟨fun t => t (R.record_has_value F),
            fun _ h => ⟨fun q => (one_seat R F).mpr (h q), fun hn q => hn ((one_seat R F).mpr (h q))⟩,
            fun _ h p s => h p s.1⟩

/-! ## The walk -/

/-- THREE BITS WALKED, on every row: the block, the hypothesis and the resolution, in that order. -/
theorem three_bits_walked : Block R ∧ Hypothesis R ∧ Resolution R :=
  ⟨the_block R, the_hypothesis R, the_resolution R⟩

/-- NO BIT IS THE NEXT: the block does not supply the Seat, and the Seat's form does not supply its value. On every
    row the three bits hold, and the Seat still fails on the counter frame. -/
theorem the_form_leaves_the_value_open : (Block R ∧ Hypothesis R ∧ Resolution R) ∧ ¬ Seat R R.counter :=
  ⟨three_bits_walked R, fun s => R.counter_fails s.1⟩

/-- THE ROOT ALONE DECIDES NOTHING: a root that grounds itself holds on every frame of every row, and it forces the
    value on none. The value of a row is the root read on the row, never the root alone. -/
theorem the_root_alone_decides_nothing {Root : Prop} (G : TOE0.SelfGrounding Root) :
    Root ∧ ¬ ∀ F : R.Frame, Root → R.Value F :=
  ⟨TOE0.seated_undeniable G, fun h => R.counter_fails (h R.counter (TOE0.seated_undeniable G))⟩

/-- THE ROOT OF PART R, READ BESIDE EVERY ROW: the constructed root is a theorem, and on every row it leaves the
    counter frame without the value. -/
theorem the_constructed_root_decides_no_row : TOE0.RA₀ ∧ ¬ ∀ F : R.Frame, TOE0.RA₀ → R.Value F :=
  the_root_alone_decides_nothing R TOE0.ra₀

/-! ## The ledger of seven (record grade, data compared by `decide`) -/

/-- The seven Millennium rows. -/
inductive Millennium
  | pnp | riemann | navierStokes | yangMills | hodge | bsd | poincare
  deriving DecidableEq

/-- The standing of a row's value in the public record on 22 November 2026. `carriedCertified`: a proof exists,
    machine-certified, and stands inside the row's Seat by theorem. `carriedCited`: a proof exists in the literature,
    accepted and not machine-checked, and stands inside the row's Seat by theorem. `waiting`: no accepted proof and no
    refutation. `waitingConditionalRefutation`: no accepted proof, and one refutation on record whose premise is
    uncertified. -/
inductive Standing
  | carriedCertified | carriedCited | waiting | waitingConditionalRefutation
  deriving DecidableEq

def standing : Millennium → Standing
  | .riemann => .carriedCertified
  | .poincare => .carriedCited
  | .navierStokes => .waitingConditionalRefutation
  | .pnp => .waiting
  | .yangMills => .waiting
  | .hodge => .waiting
  | .bsd => .waiting

def rows : List Millennium := [.pnp, .riemann, .navierStokes, .yangMills, .hodge, .bsd, .poincare]

/-- First public date of the proof a row's Seat carries, as YYYYMMDD: Perelman, arXiv math/0211159, 11 November 2002;
    Alpöge, 20 November 2026. Zero where no proof is carried. -/
def proofFirstPublic : Millennium → Nat
  | .poincare => 20021111
  | .riemann => 20261120
  | _ => 0

/-- The day the Seat of every row was compiled, 22 November 2026. -/
def seatCompiled : Nat := 20261122

/-- THE LEDGER OF SEVEN, CHECKED: seven rows; two carried, one certified and one cited; five waiting, one of them
    under a conditional refutation; both carried proofs public before the Seat was compiled, Perelman's by
    twenty-three years. -/
theorem the_ledger_of_seven :
    rows.length = 7 ∧
    (rows.filter fun m => standing m == .carriedCertified) = [.riemann] ∧
    (rows.filter fun m => standing m == .carriedCited) = [.poincare] ∧
    (rows.filter fun m => standing m == .waitingConditionalRefutation) = [.navierStokes] ∧
    (rows.filter fun m => standing m == .waiting) = [.pnp, .yangMills, .hodge, .bsd] ∧
    proofFirstPublic .poincare < seatCompiled ∧ proofFirstPublic .riemann < seatCompiled ∧
    proofFirstPublic .poincare + 230000 < proofFirstPublic .riemann := by
  decide

end ThreeBits

/-! ## cones of Part T, pinned -/
/-- info: 'ThreeBits.one_seat' does not depend on any axioms -/
#guard_msgs in #print axioms ThreeBits.one_seat
/-- info: 'ThreeBits.every_face_is_the_seat' does not depend on any axioms -/
#guard_msgs in #print axioms ThreeBits.every_face_is_the_seat
/-- info: 'ThreeBits.the_block' does not depend on any axioms -/
#guard_msgs in #print axioms ThreeBits.the_block
/-- info: 'ThreeBits.the_hypothesis' does not depend on any axioms -/
#guard_msgs in #print axioms ThreeBits.the_hypothesis
/-- info: 'ThreeBits.the_resolution' does not depend on any axioms -/
#guard_msgs in #print axioms ThreeBits.the_resolution
/-- info: 'ThreeBits.three_bits_walked' does not depend on any axioms -/
#guard_msgs in #print axioms ThreeBits.three_bits_walked
/-- info: 'ThreeBits.the_form_leaves_the_value_open' does not depend on any axioms -/
#guard_msgs in #print axioms ThreeBits.the_form_leaves_the_value_open
/-- info: 'ThreeBits.the_root_alone_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms ThreeBits.the_root_alone_decides_nothing
/-- info: 'ThreeBits.the_constructed_root_decides_no_row' does not depend on any axioms -/
#guard_msgs in #print axioms ThreeBits.the_constructed_root_decides_no_row
/-- info: 'ThreeBits.the_ledger_of_seven' does not depend on any axioms -/
#guard_msgs in #print axioms ThreeBits.the_ledger_of_seven
