/-
Row_Split.lean · the Real/Unicorn division on any row, for any cut; the row specifications of
the arithmetic rows; the gap-to-interval bridge; the standing map.
Core Lean 4.19.0, no library, no sorry, no user-declared axiom. Forged 2026-09-25, fortified
after the two external batches of the same day.

The Riemann division used the cut "height ≤ T". Nothing in it used the height: the same theorem
holds for any decidable predicate on the row's instances, a height, a degree, a dimension, a
rank, a box, a regime. So the division of the twenty-three rows is one kernel theorem, applied
row by row with the row's own cut. ΔM = 0.
-/
namespace RowSplit

variable {α : Type}

/-! ## I. The division -/

/-- A row's value: every instance satisfies the row's property. -/
def Row (Inst P : α → Prop) : Prop := ∀ x, Inst x → P x
/-- The Real part under a cut: every instance inside the cut satisfies the property. -/
def RealIn (Inst P cut : α → Prop) : Prop := ∀ x, Inst x → cut x → P x
/-- The Unicorn part under a cut: no instance outside the cut fails the property. -/
def UnicornOut (Inst P cut : α → Prop) : Prop := ∀ x, Inst x → ¬ cut x → P x

/-- THE DIVISION, for any cut: the row is exactly its Real part and its Unicorn part. -/
theorem row_iff_real_and_unicorn (Inst P cut : α → Prop) [DecidablePred cut] :
    Row Inst P ↔ RealIn Inst P cut ∧ UnicornOut Inst P cut := by
  constructor
  · intro h; exact ⟨fun x hx _ => h x hx, fun x hx _ => h x hx⟩
  · intro ⟨hr, hu⟩ x hx
    by_cases hc : cut x
    · exact hr x hx hc
    · exact hu x hx hc

/-- Given the Real part, the fused row is exactly the Unicorn part. -/
theorem fused_is_unicorn_given_real (Inst P cut : α → Prop) [DecidablePred cut]
    (hr : RealIn Inst P cut) : Row Inst P ↔ UnicornOut Inst P cut :=
  ⟨fun h x hx _ => h x hx, fun hu => (row_iff_real_and_unicorn Inst P cut).2 ⟨hr, hu⟩⟩

/-- A certificate for a cut: a complete list of the instances inside it, each checked. -/
structure Certificate (Inst P cut : α → Prop) where
  items    : List α
  complete : ∀ x, Inst x → cut x → x ∈ items
  checked  : ∀ x, x ∈ items → P x

/-- A certificate proves the Real part of the cut, on any row, with no premise. -/
theorem real_of_certificate (Inst P cut : α → Prop) (c : Certificate Inst P cut) :
    RealIn Inst P cut :=
  fun x hx hc => c.checked x (c.complete x hx hc)

/-- On an infinitude row, instances are bounds N and the property is that a witness exceeds N.
    One exhibited witness w above the height h proves the Real part under the cut N ≤ h. -/
theorem real_of_one_witness (W : Nat → Prop) (h w : Nat) (hw : W w) (hwh : h < w) :
    RealIn (fun _ => True) (fun N => ∃ m, N < m ∧ W m) (fun N => N ≤ h) :=
  fun _ _ hN => ⟨w, Nat.lt_of_le_of_lt hN hwh, hw⟩

/-- On an infinitude row the Unicorn part above any height is equivalent to the whole value: a
    witness above every bound beyond h is a witness above every bound. So the Real part of an
    infinitude row is proved by one witness and moves the fused value not at all. -/
theorem unicorn_equiv_row_of_infinitude (W : Nat → Prop) (h : Nat) :
    (∀ N, ¬ N ≤ h → ∃ m, N < m ∧ W m) ↔ (∀ N, ∃ m, N < m ∧ W m) := by
  constructor
  · intro hu N
    if hN : N ≤ h then
      obtain ⟨m, hm, hw⟩ := hu (h + 1) (fun hle => Nat.not_succ_le_self h hle)
      exact ⟨m, Nat.lt_of_le_of_lt hN (Nat.lt_trans (Nat.lt_succ_self h) hm), hw⟩
    else
      exact hu N hN
  · intro hr N _; exact hr N

/-- A crossed row (its value supplied whole) satisfies both parts under every cut. -/
theorem crossed_row_both_parts (Inst P cut : α → Prop) (h : Row Inst P) :
    UnicornOut Inst P cut ∧ RealIn Inst P cut :=
  ⟨fun x hx _ => h x hx, fun x hx _ => h x hx⟩

/-- Under the empty cut the Real part is vacuous and the Unicorn part is the whole value. This
    theorem is about the empty cut and nothing else; it does not say that a row admits no other
    cut, which is an assessment of a row's literature and never a theorem. -/
theorem empty_cut_vacuous (Inst P : α → Prop) :
    RealIn Inst P (fun _ => False) ∧ (UnicornOut Inst P (fun _ => False) ↔ Row Inst P) :=
  ⟨fun _ _ h => h.elim, ⟨fun hu x hx => hu x hx (fun h => h), fun h x hx _ => h x hx⟩⟩

/-! ## II. Substantive Real parts, and the Unicorn part as a set of counterexamples -/

/-- A cut is inhabited on the row when some instance lies inside it. -/
def Inhabited (Inst cut : α → Prop) : Prop := ∃ x, Inst x ∧ cut x
/-- A substantive Real part: an inhabited cut with its Real part. The empty cut never has one. -/
def SubstantiveRealIn (Inst P cut : α → Prop) : Prop := Inhabited Inst cut ∧ RealIn Inst P cut

theorem empty_cut_not_substantive (Inst P : α → Prop) :
    ¬ SubstantiveRealIn Inst P (fun _ => False) :=
  fun ⟨⟨_, _, h⟩, _⟩ => h

/-- A counterexample outside the cut: an instance outside it that fails the property. The
    Unicorn part, read as a set, is the set of these; the Unicorn proposition says it is empty. -/
def CounterOut (Inst P cut : α → Prop) (x : α) : Prop := Inst x ∧ ¬ cut x ∧ ¬ P x

theorem no_counter_of_unicorn (Inst P cut : α → Prop) (hu : UnicornOut Inst P cut) :
    ∀ x, ¬ CounterOut Inst P cut x :=
  fun x ⟨hx, hc, hp⟩ => hp (hu x hx hc)

theorem unicorn_of_no_counter (Inst P cut : α → Prop) [DecidablePred P]
    (h : ∀ x, ¬ CounterOut Inst P cut x) : UnicornOut Inst P cut := by
  intro x hx hc
  by_cases hp : P x
  · exact hp
  · exact absurd ⟨hx, hc, hp⟩ (h x)

/-- A crossed row has no counterexample outside any cut: its Unicorn set is empty. -/
theorem crossed_row_no_counter (Inst P cut : α → Prop) (h : Row Inst P) :
    ∀ x, ¬ CounterOut Inst P cut x :=
  no_counter_of_unicorn Inst P cut (crossed_row_both_parts Inst P cut h).1

/-! ## III. The standing map: fusion lowers a proved part to open, as a declared rule -/

/-- Two standings: proved, or open. -/
inductive Standing | proved | opn
  deriving DecidableEq, Repr

/-- The standing of a conjunction is the weaker standing of its conjuncts: the program's grade
    law, declared here as the rule the fusion sentence is read under. -/
def Standing.join : Standing → Standing → Standing
  | .proved, .proved => .proved
  | _, _ => .opn

/-- Under the declared rule, a proved part joined to an open part stands open; only two proved
    parts stand proved. The theorem records the rule; the lowering is the rule's, not the kernel's. -/
theorem fusion_lowers : Standing.join .proved .opn = .opn ∧ Standing.join .opn .proved = .opn ∧
    Standing.join .proved .proved = .proved := ⟨rfl, rfl, rfl⟩

/-! ## IV. The gap-to-interval bridge, for the Legendre row -/

/-- a - q < a - p when p < q and p < a; proved by induction to keep the file free of propext. -/
theorem sub_lt_sub_of_lt : ∀ (a p q : Nat), p < a → p < q → a - q < a - p
  | 0, _, _, h, _ => absurd h (Nat.not_lt_zero _)
  | a + 1, 0, 0, _, hpq => absurd hpq (Nat.lt_irrefl 0)
  | a + 1, 0, q + 1, _, _ => by
      rw [Nat.succ_sub_succ, Nat.sub_zero]
      exact Nat.lt_succ_of_le (Nat.sub_le a q)
  | _ + 1, p + 1, 0, _, hpq => absurd hpq (Nat.not_lt_zero _)
  | a + 1, p + 1, q + 1, hpa, hpq => by
      rw [Nat.succ_sub_succ, Nat.succ_sub_succ]
      exact sub_lt_sub_of_lt a p q (Nat.lt_of_succ_lt_succ hpa) (Nat.lt_of_succ_lt_succ hpq)

/-- From a bound g on the gap after every element of Q up to X, and an element of Q at or below
    a, an element of Q lies in (a, a + g], provided a ≤ X. Q is any predicate; the primes are the
    instance. Recursion on a - p. -/
theorem elem_in_gap (Q : Nat → Prop) (g X : Nat)
    (hgap : ∀ p, Q p → p ≤ X → ∃ q, Q q ∧ p < q ∧ q ≤ p + g)
    (a : Nat) (ha : a ≤ X) (p : Nat) (hp : Q p) (hpa : p ≤ a) :
    ∃ q, Q q ∧ a < q ∧ q ≤ a + g := by
  obtain ⟨q, hq, hpq, hqg⟩ := hgap p hp (Nat.le_trans hpa ha)
  if hqa : a < q then
    exact ⟨q, hq, hqa, Nat.le_trans hqg (Nat.add_le_add_right hpa g)⟩
  else
    have hqa' : q ≤ a := Nat.le_of_not_lt hqa
    have hpa' : p < a := Nat.lt_of_lt_of_le hpq hqa'
    exact elem_in_gap Q g X hgap a ha q hq hqa'
termination_by a - p
decreasing_by exact sub_lt_sub_of_lt a p q hpa' hpq

theorem sq_succ (n : Nat) : (n + 1) * (n + 1) = n * n + 2 * n + 1 := by
  rw [Nat.mul_succ, Nat.succ_mul, Nat.two_mul, Nat.add_assoc (n * n) n (n + 1),
    ← Nat.add_assoc n n 1, ← Nat.add_assoc (n * n) (n + n) 1]

/-- THE LEGENDRE BRIDGE: if every gap between consecutive elements of Q up to X is at most 1476,
    Q holds at 2, n ≥ 738, and (n+1)² ≤ X, then Q has an element strictly between n² and (n+1)².
    The gap bound is the literature's [Oliveira e Silva, Herzog and Pardi 2014] with Q the primes
    and X = 4·10¹⁸; the bridge is the kernel's. -/
theorem legendre_of_gap (Q : Nat → Prop) (X : Nat)
    (hgap : ∀ p, Q p → p ≤ X → ∃ q, Q q ∧ p < q ∧ q ≤ p + 1476)
    (h2 : Q 2) (n : Nat) (hn : 738 ≤ n) (hX : (n + 1) * (n + 1) ≤ X) :
    ∃ q, Q q ∧ n * n < q ∧ q < (n + 1) * (n + 1) := by
  have hsq := sq_succ n
  have h738 : 738 ≤ n * n := Nat.le_trans hn (Nat.le_mul_of_pos_right n (Nat.lt_of_lt_of_le (by decide) hn))
  have hnn : 2 ≤ n * n := Nat.le_trans (by decide) h738
  have ha : n * n ≤ X := Nat.le_trans (Nat.mul_le_mul (Nat.le_succ n) (Nat.le_succ n)) hX
  obtain ⟨q, hq, hlt, hle⟩ := elem_in_gap Q 1476 X hgap (n * n) ha 2 h2 hnn
  have hgapn : 1476 < 2 * n + 1 :=
    Nat.lt_of_lt_of_le (by decide) (Nat.add_le_add_right (Nat.mul_le_mul_left 2 hn) 1)
  have hq2 : q < (n + 1) * (n + 1) := by
    rw [hsq, Nat.add_assoc]
    exact Nat.lt_of_le_of_lt hle (Nat.add_lt_add_left hgapn (n * n))
  exact ⟨q, hq, hlt, hq2⟩

/-! ## V. Row specifications: the exact tuple (α, Inst, P, cut) of the arithmetic height-cut rows,
    with primality and the properties defined in core Lean, and the Real part at a small height
    computed in the kernel. The literature's heights are cited in the paper; none is recomputed
    here. -/

/-- Trial-division primality, decidable. -/
def isPrime (n : Nat) : Bool := 2 ≤ n && (List.range n).all (fun d => d < 2 || n % d != 0)

/-- Goldbach at n: n is even and at least 4 implies n is a sum of two primes. -/
def goldbachOK (n : Nat) : Bool :=
  n < 4 || n % 2 == 1 || (List.range (n + 1)).any (fun p => isPrime p && isPrime (n - p))
/-- Legendre at n: a prime strictly between n² and (n+1)². -/
def legendreOK (n : Nat) : Bool :=
  n == 0 || (List.range ((n + 1) * (n + 1))).any (fun q => n * n < q && isPrime q)
/-- Odd perfect at n: n is not an odd perfect number. -/
def sigma (n : Nat) : Nat := ((List.range (n + 1)).filter (fun d => d != 0 && n % d == 0)).foldl (· + ·) 0
def oddPerfectOK (n : Nat) : Bool := n == 0 || n % 2 == 0 || sigma n != 2 * n
/-- Collatz at n: the orbit reaches 1 within a step budget of 200. -/
def collatzStep (n : Nat) : Nat := if n % 2 == 0 then n / 2 else 3 * n + 1
def collatzReaches : Nat → Nat → Bool
  | _, 0 => false
  | n, fuel + 1 => n == 1 || collatzReaches (collatzStep n) fuel
def collatzOK (n : Nat) : Bool := n == 0 || collatzReaches n 200
/-- Erdős–Straus at n: 4/n = 1/x + 1/y + 1/z with x ≤ y ≤ z ≤ n², searched. -/
def erdosStrausOK (n : Nat) : Bool :=
  n < 2 || (List.range (n * n + 1)).any (fun x => x != 0 &&
    (List.range (n * n + 1)).any (fun y => x ≤ y &&
      (List.range (n * n + 1)).any (fun z => y ≤ z && 4 * x * y * z == n * (y * z + x * z + x * y))))
/-- Beal on the box (A, B ≤ a; x, y, z ≤ e): no coprime solution of A^x + B^y = C^z. -/
def gcdF : Nat → Nat → Nat → Nat
  | 0, a, _ => a
  | fuel + 1, a, b => if b == 0 then a else gcdF fuel b (a % b)
def gcd' (a b : Nat) : Nat := gcdF (a + b + 1) a b
def bealOK (a e : Nat) : Bool :=
  (List.range (a + 1)).all (fun A => (List.range (a + 1)).all (fun B =>
    A == 0 || B == 0 || gcd' A B != 1 ||
    (List.range (e + 1)).all (fun x => (List.range (e + 1)).all (fun y =>
      x < 3 || y < 3 ||
      (List.range (A ^ x + B ^ y + 1)).all (fun C =>
        C < 2 || (List.range (e + 1)).all (fun z => z < 3 || C ^ z != A ^ x + B ^ y))))))

/-- A bounded universal computed as a structural check is the Real part under the height cut. -/
def allUpTo (f : Nat → Bool) : Nat → Bool
  | 0 => f 0
  | h + 1 => f (h + 1) && allUpTo f h

theorem allUpTo_spec (f : Nat → Bool) : ∀ h, allUpTo f h = true → ∀ n, n ≤ h → f n = true
  | 0, hall, n, hn => by
      have h0 : n = 0 := Nat.eq_zero_of_le_zero hn
      subst h0; exact hall
  | h + 1, hall, n, hn => by
      have hsplit : f (h + 1) = true ∧ allUpTo f h = true := by
        have hall' : (f (h + 1) && allUpTo f h) = true := hall
        revert hall'
        generalize f (h + 1) = a
        generalize allUpTo f h = b
        cases a <;> cases b <;> intro hab <;>
          first | exact ⟨rfl, rfl⟩ | exact Bool.noConfusion hab
      cases Nat.lt_or_eq_of_le hn with
      | inl hlt => exact allUpTo_spec f h hsplit.2 n (Nat.le_of_lt_succ hlt)
      | inr heq => subst heq; exact hsplit.1

theorem real_of_all_range (f : Nat → Bool) (h : Nat) (hall : allUpTo f h = true) :
    RealIn (fun _ => True) (fun n => f n = true) (fun n => n ≤ h) :=
  fun n _ hn => allUpTo_spec f h hall n hn

set_option maxRecDepth 100000 in
theorem goldbach_real_60 : RealIn (fun _ => True) (fun n => goldbachOK n = true) (fun n => n ≤ 60) :=
  real_of_all_range goldbachOK 60 (by decide)
set_option maxRecDepth 100000 in
theorem legendre_real_8 : RealIn (fun _ => True) (fun n => legendreOK n = true) (fun n => n ≤ 8) :=
  real_of_all_range legendreOK 8 (by decide)
set_option maxRecDepth 100000 in
theorem oddperfect_real_60 : RealIn (fun _ => True) (fun n => oddPerfectOK n = true) (fun n => n ≤ 60) :=
  real_of_all_range oddPerfectOK 60 (by decide)
set_option maxRecDepth 100000 in
theorem collatz_real_60 : RealIn (fun _ => True) (fun n => collatzOK n = true) (fun n => n ≤ 60) :=
  real_of_all_range collatzOK 60 (by decide)
set_option maxRecDepth 100000 in
theorem erdosstraus_real_6 : RealIn (fun _ => True) (fun n => erdosStrausOK n = true) (fun n => n ≤ 6) :=
  real_of_all_range erdosStrausOK 6 (by decide)
set_option maxRecDepth 100000 in
theorem beal_box_3_4 : bealOK 3 4 = true := by decide
set_option maxRecDepth 100000 in
theorem twin_real_100 : RealIn (fun _ => True) (fun N => ∃ m, N < m ∧ (isPrime m && isPrime (m + 2)) = true) (fun N => N ≤ 100) :=
  real_of_one_witness (fun m => (isPrime m && isPrime (m + 2)) = true) 100 101 (by decide) (by decide)
set_option maxRecDepth 100000 in
def isMersenne (q : Nat) : Bool := (List.range 20).any (fun m => 2 ^ m - 1 == q)
theorem mersenne_real_100 : RealIn (fun _ => True) (fun N => ∃ q, N < q ∧ (isPrime q && isMersenne q) = true) (fun N => N ≤ 100) :=
  real_of_one_witness (fun q => (isPrime q && isMersenne q) = true) 100 127 (by decide) (by decide)

/-! ## VI. The twenty-three rows, typed by shape, the census of the assignments kernel-checked -/

/-- The shape of a row's cut, as assigned: a height (a bounded universal with a certificate
    per height, or an infinitude with one witness), a regime (a dimension, degree, rank, or class
    proved by a cited theorem), no cut (no inhabited cut with a Real part in the literature, an
    assessment), or crossed (the value supplied whole). The assignments are data; the kernel
    checks their census. -/
inductive Shape | height | regime | noCut | crossed
  deriving DecidableEq, Repr

def rows23 : List (String × Shape) :=
  [("P versus NP", .regime), ("Riemann Hypothesis", .height), ("Navier–Stokes", .regime),
   ("Yang–Mills", .regime), ("Hodge", .regime), ("BSD", .regime), ("Poincaré", .crossed),
   ("Goldbach", .height), ("Twin primes", .height), ("Legendre", .height), ("abc", .noCut),
   ("Jacobian", .regime), ("Mersenne primes", .height), ("Odd perfect numbers", .height),
   ("Smooth 4D Poincaré", .regime), ("Collatz", .height), ("Hadwiger", .regime),
   ("Sunflower", .noCut), ("Erdős–Straus", .height), ("Beal", .height),
   ("Invariant subspace", .regime), ("Hilbert's 16th, second part", .regime),
   ("Lindelöf / Montgomery PCC", .regime)]

def countShape (s : Shape) : Nat := (rows23.filter (fun r => r.2 == s)).length

/-- THE CENSUS OF THE ASSIGNMENTS: twenty-three rows; nine height-cut, eleven regime-cut, two
    no-cut, one crossed; twenty assigned a Real-part-bearing shape. -/
theorem census :
    rows23.length = 23 ∧ countShape .height = 9 ∧ countShape .regime = 11 ∧
    countShape .noCut = 2 ∧ countShape .crossed = 1 ∧
    countShape .height + countShape .regime = 20 := by decide

def hasRealPart (s : Shape) : Bool := s == .height || s == .regime
theorem real_part_rows : (rows23.filter (fun r => hasRealPart r.2)).length = 20 := by decide

end RowSplit

#print axioms RowSplit.row_iff_real_and_unicorn
#print axioms RowSplit.fused_is_unicorn_given_real
#print axioms RowSplit.real_of_certificate
#print axioms RowSplit.real_of_one_witness
#print axioms RowSplit.unicorn_equiv_row_of_infinitude
#print axioms RowSplit.crossed_row_both_parts
#print axioms RowSplit.empty_cut_vacuous
#print axioms RowSplit.empty_cut_not_substantive
#print axioms RowSplit.no_counter_of_unicorn
#print axioms RowSplit.unicorn_of_no_counter
#print axioms RowSplit.crossed_row_no_counter
#print axioms RowSplit.fusion_lowers
#print axioms RowSplit.sub_lt_sub_of_lt
#print axioms RowSplit.elem_in_gap
#print axioms RowSplit.legendre_of_gap
#print axioms RowSplit.allUpTo_spec
#print axioms RowSplit.real_of_all_range
#print axioms RowSplit.goldbach_real_60
#print axioms RowSplit.legendre_real_8
#print axioms RowSplit.oddperfect_real_60
#print axioms RowSplit.collatz_real_60
#print axioms RowSplit.erdosstraus_real_6
#print axioms RowSplit.beal_box_3_4
#print axioms RowSplit.twin_real_100
#print axioms RowSplit.mersenne_real_100
#print axioms RowSplit.census
#print axioms RowSplit.real_part_rows
