/-! ## SECTION 19 · THE PSP CODEX, INTEGRABLE PART · GEOMETRY'S OWN ALGEBRA, THE CASCADE CENSUS, THE ORIENTATION

    Screened out of the PSP codex 1.0.2 by class. What splices into the
    master is what SEALS mathematically and touches objects the master
    already carries: the quaternion, octonion and sedenion cluster
    (P2-P6), the cascade and token census (P7-P9, P22), and the
    orientation-blindness of the lock scalar (P1). Every theorem here is
    decided or proved against the master's own `Rat` and `Nat.factorial`;
    nothing is a posit. Namespaces are PSP.* and collide with none of the
    master's. Delta-M = 0.

    Doctrine of this section, the architect's: seal, witness with one bit,
    hard stop. No question is posed that was not asked. -/
namespace PSP.ORIENT

abbrev V3 := Rat × Rat × Rat
abbrev M3 := V3 × V3 × V3

def det3 (m : M3) : Rat :=
  m.1.1 * (m.2.1.2.1 * m.2.2.2.2 - m.2.1.2.2 * m.2.2.2.1)
  - m.1.2.1 * (m.2.1.1 * m.2.2.2.2 - m.2.1.2.2 * m.2.2.1)
  + m.1.2.2 * (m.2.1.1 * m.2.2.2.1 - m.2.1.2.1 * m.2.2.1)

def neg3 (m : M3) : M3 :=
  ((-m.1.1, -m.1.2.1, -m.1.2.2),
   (-m.2.1.1, -m.2.1.2.1, -m.2.1.2.2),
   (-m.2.2.1, -m.2.2.2.1, -m.2.2.2.2))

def signMatrices : List M3 :=
  [ (( 1,0,0),(0, 1,0),(0,0, 1)), ((-1,0,0),(0, 1,0),(0,0, 1)),
    (( 1,0,0),(0,-1,0),(0,0, 1)), (( 1,0,0),(0, 1,0),(0,0,-1)),
    ((-1,0,0),(0,-1,0),(0,0, 1)), ((-1,0,0),(0, 1,0),(0,0,-1)),
    (( 1,0,0),(0,-1,0),(0,0,-1)), ((-1,0,0),(0,-1,0),(0,0,-1)) ]

theorem lock_scalar_sign_blind :
    signMatrices.all (fun m =>
      det3 m * det3 m == det3 (neg3 m) * det3 (neg3 m)) = true := by decide

theorem det_sign_flips_in_odd_dimension :
    signMatrices.all (fun m => det3 (neg3 m) == -det3 m) = true := by decide

end PSP.ORIENT

namespace PSP.QUAT

abbrev Q := Rat × Rat × Rat × Rat   -- (w, x, y, z) = w + x i + y j + z k

def qmul (p q : Q) : Q :=
  (p.1*q.1 - p.2.1*q.2.1 - p.2.2.1*q.2.2.1 - p.2.2.2*q.2.2.2,
   p.1*q.2.1 + p.2.1*q.1 + p.2.2.1*q.2.2.2 - p.2.2.2*q.2.2.1,
   p.1*q.2.2.1 - p.2.1*q.2.2.2 + p.2.2.1*q.1 + p.2.2.2*q.2.1,
   p.1*q.2.2.2 + p.2.1*q.2.2.1 - p.2.2.1*q.2.1 + p.2.2.2*q.1)

def qi : Q := (0,1,0,0)
def qj : Q := (0,0,1,0)
def qk : Q := (0,0,0,1)
def qneg1 : Q := (-1,0,0,0)

theorem quat_basis_laws :
    qmul qi qi = qneg1 ∧ qmul qj qj = qneg1 ∧ qmul qk qk = qneg1 ∧
    qmul (qmul qi qj) qk = qneg1 := by decide

end PSP.QUAT

namespace PSP.QUAT

def qnorm (p : Q) : Rat := p.1^2 + p.2.1^2 + p.2.2.1^2 + p.2.2.2^2
def isInt (r : Rat) : Bool := r.den == 1
def isHalf (r : Rat) : Bool := r.den == 2
def hurwitzOK (p : Q) : Bool :=
  (isInt p.1 && isInt p.2.1 && isInt p.2.2.1 && isInt p.2.2.2) ||
  (isHalf p.1 && isHalf p.2.1 && isHalf p.2.2.1 && isHalf p.2.2.2)

def grid : List Rat := [-1, -1/2, 0, 1/2, 1]
def tuples4 : List Q :=
  grid.flatMap fun a => grid.flatMap fun b =>
    grid.flatMap fun c => grid.map fun d => (a,b,c,d)

theorem hurwitz_units_24 :
    (tuples4.filter fun p => hurwitzOK p && qnorm p == 1).length = 24 := by decide

end PSP.QUAT

namespace PSP.QUAT

def grid2 : List Rat := [-2, -1, 0, 1, 2]
def tuples4i : List Q :=
  grid2.flatMap fun a => grid2.flatMap fun b =>
    grid2.flatMap fun c => grid2.map fun d => (a,b,c,d)

theorem norm2_shell_split :
    (tuples4i.filter fun p => qnorm p == 2).length = 24 ∧
    (tuples4i.filter fun p => qnorm p == 2 && p.1 == 0).length = 12 ∧
    (tuples4i.filter fun p => qnorm p == 2 && p.1 != 0).length = 12 := by decide

end PSP.QUAT

namespace PSP.CD

def cdconj : List Rat → List Rat
  | [] => []
  | [a] => [a]
  | a :: rest => a :: rest.map (fun x => -x)

def padd : List Rat → List Rat → List Rat := List.zipWith (· + ·)
def psub : List Rat → List Rat → List Rat := List.zipWith (· - ·)

def cdmul : Nat → List Rat → List Rat → List Rat
  | 0, _, _ => []
  | _+1, [a], [b] => [a * b]
  | fuel+1, a, b =>
      let n := a.length / 2
      let a1 := a.take n; let a2 := a.drop n
      let b1 := b.take n; let b2 := b.drop n
      psub (cdmul fuel a1 b1) (cdmul fuel (cdconj b2) a2) ++
      padd (cdmul fuel b2 a1) (cdmul fuel a2 (cdconj b1))

def e (n i : Nat) : List Rat := List.replicate i 0 ++ [1] ++ List.replicate (n - i - 1) 0
def smul (s : Rat) (v : List Rat) : List Rat := v.map (fun x => s * x)

theorem octonion_associator :
    psub (cdmul 4 (cdmul 4 (e 8 1) (e 8 2)) (e 8 4))
         (cdmul 4 (e 8 1) (cdmul 4 (e 8 2) (e 8 4)))
    = smul 2 (e 8 7) := by decide

end PSP.CD

namespace PSP.CD

def sx : List Rat := padd (e 16 1) (e 16 10)
-- REPAIR v1.0.1.2: 1.0.1 wrote sy = e4 + e15, which is NOT a zero divisor
-- against sx = e1 + e10 under this Cayley-Dickson doubling: the product is
-- 2e5 - 2e14, and `decide` returned the whole conjunction FALSE. Exhaustive
-- search over all (a<b, c<d) basis pairs finds 84 genuine zero-divisor pairs;
-- (e1+e10, e5+e14) is the first and is the classical exhibit. Pair corrected,
-- claim unweakened.
def sy : List Rat := padd (e 16 5) (e 16 14)
def zero16 : List Rat := List.replicate 16 0
def sqnorm (v : List Rat) : Rat := (v.map fun x => x^2).sum

theorem sedenion_zero_divisor :
    cdmul 5 sx sy = zero16 ∧ sx ≠ zero16 ∧ sy ≠ zero16
    ∧ sqnorm sx = 2 ∧ sqnorm sy = 2 := by decide

end PSP.CD

namespace PSP.CASCADE

def cascade : List Bool → Option Nat
  | [] => none
  | false :: _ => some 0
  | true :: gs => (cascade gs).map Nat.succ

def patterns8 : List (List Bool) :=
  (List.range 256).map fun b => (List.range 8).map fun j => b.testBit j

def spec (bits : List Bool) : Bool :=
  match cascade bits with
  | none => bits.all id
  | some k => (bits.take k).all id && (bits[k]? == some false)

theorem first_failure_terminal_8 :
    patterns8.all spec = true := by decide

theorem halt_free_iff_all_pass_8 :
    patterns8.all (fun bits => (cascade bits).isNone == bits.all id) = true := by decide

end PSP.CASCADE

namespace PSP.GROUNDLESS

def o0Neighbors : List String :=
  ["sigma-token", "dissolve-openness", "ordinary-openness",
   "resolved-states", "broken-or-ghost"]

def fiveCubeCoords : List String :=
  ["Ground-dimension", "determinacy", "blockage", "aperture", "totality"]

def deg5 (v : Nat) : Nat :=
  ((List.range 5).map fun j => v ^^^ (1 <<< j)).eraseDups.length

theorem groundless_cascade_degree :
    o0Neighbors.length = 5 ∧ fiveCubeCoords.length = 5 ∧
    o0Neighbors.length ≠ 7 ∧ o0Neighbors.length ≠ 8 ∧
    (List.range 32).all (fun v => deg5 v == 5) = true := by decide

end PSP.GROUNDLESS

namespace PSP.TOKEN

inductive TerminalToken | xi0 | o0 deriving DecidableEq

def level : TerminalToken → Nat := fun _ => 3

theorem terminal_tokens_level_and_distinct :
    level TerminalToken.xi0 = level TerminalToken.o0 ∧
    TerminalToken.xi0 ≠ TerminalToken.o0 := ⟨rfl, by decide⟩

end PSP.TOKEN

namespace PSP.TWOGROUP

theorem two_group_census :
    Nat.factorial 4 / 2 = 12 ∧ 2^3 = 8 := by decide

end PSP.TWOGROUP

/-! ### SECTION 19 · GATE THREE EXTENSION
    The roster guards for every declaration of this section, 48 of them,
    generated from the merge probe and never typed by hand. At splice time
    each of these names also enters `codexCone`, and the master's roster,
    cone and census are regenerated from the merged file; this block is
    what the generator must reproduce, and the splice fails if it does not.
    Profile: 41 on propext, 7 axiom-free, none on a posit, none classical. -/

/-- info: 'PSP.ORIENT.V3' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.V3
/-- info: 'PSP.ORIENT.M3' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.M3
/-- info: 'PSP.ORIENT.det3' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.det3
/-- info: 'PSP.ORIENT.neg3' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.neg3
/-- info: 'PSP.ORIENT.signMatrices' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.signMatrices
/-- info: 'PSP.ORIENT.lock_scalar_sign_blind' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.lock_scalar_sign_blind
/-- info: 'PSP.ORIENT.det_sign_flips_in_odd_dimension' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.det_sign_flips_in_odd_dimension
/-- info: 'PSP.QUAT.Q' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.Q
/-- info: 'PSP.QUAT.qmul' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.qmul
/-- info: 'PSP.QUAT.qi' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.qi
/-- info: 'PSP.QUAT.qj' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.qj
/-- info: 'PSP.QUAT.qk' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.qk
/-- info: 'PSP.QUAT.qneg1' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.qneg1
/-- info: 'PSP.QUAT.quat_basis_laws' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.quat_basis_laws
/-- info: 'PSP.QUAT.qnorm' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.qnorm
/-- info: 'PSP.QUAT.isInt' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.isInt
/-- info: 'PSP.QUAT.isHalf' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.isHalf
/-- info: 'PSP.QUAT.hurwitzOK' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.hurwitzOK
/-- info: 'PSP.QUAT.grid' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.grid
/-- info: 'PSP.QUAT.tuples4' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.tuples4
/-- info: 'PSP.QUAT.hurwitz_units_24' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.hurwitz_units_24
/-- info: 'PSP.QUAT.grid2' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.grid2
/-- info: 'PSP.QUAT.tuples4i' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.tuples4i
/-- info: 'PSP.QUAT.norm2_shell_split' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.norm2_shell_split
/-- info: 'PSP.CD.cdconj' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.cdconj
/-- info: 'PSP.CD.padd' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.padd
/-- info: 'PSP.CD.psub' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.psub
/-- info: 'PSP.CD.cdmul' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.cdmul
/-- info: 'PSP.CD.e' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.e
/-- info: 'PSP.CD.smul' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.smul
/-- info: 'PSP.CD.octonion_associator' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.octonion_associator
/-- info: 'PSP.CD.sx' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.sx
/-- info: 'PSP.CD.sy' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.sy
/-- info: 'PSP.CD.zero16' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.zero16
/-- info: 'PSP.CD.sqnorm' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.sqnorm
/-- info: 'PSP.CD.sedenion_zero_divisor' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.sedenion_zero_divisor
/-- info: 'PSP.CASCADE.cascade' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.CASCADE.cascade
/-- info: 'PSP.CASCADE.patterns8' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CASCADE.patterns8
/-- info: 'PSP.CASCADE.spec' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.CASCADE.spec
/-- info: 'PSP.CASCADE.first_failure_terminal_8' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CASCADE.first_failure_terminal_8
/-- info: 'PSP.CASCADE.halt_free_iff_all_pass_8' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CASCADE.halt_free_iff_all_pass_8
/-- info: 'PSP.GROUNDLESS.o0Neighbors' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.GROUNDLESS.o0Neighbors
/-- info: 'PSP.GROUNDLESS.fiveCubeCoords' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.GROUNDLESS.fiveCubeCoords
/-- info: 'PSP.GROUNDLESS.deg5' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.GROUNDLESS.deg5
/-- info: 'PSP.GROUNDLESS.groundless_cascade_degree' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.GROUNDLESS.groundless_cascade_degree
/-- info: 'PSP.TOKEN.level' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.TOKEN.level
/-- info: 'PSP.TOKEN.terminal_tokens_level_and_distinct' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.TOKEN.terminal_tokens_level_and_distinct
/-- info: 'PSP.TWOGROUP.two_group_census' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.TWOGROUP.two_group_census
